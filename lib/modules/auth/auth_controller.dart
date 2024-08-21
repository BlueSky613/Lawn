import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawnflutter/modules/home/home.dart';
import 'package:lawnflutter/routes/routes.dart';
import 'package:lawnflutter/api/api.dart';
import 'package:lawnflutter/models/models.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerFirstNameController = TextEditingController();
  TextEditingController registerLastNameController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerAddressController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController verifyCodeController = TextEditingController();
  TextEditingController serviceAmountController = TextEditingController();
  RxList<dynamic> serviceList = RxList<dynamic>();
  RxList<dynamic> filteredServiceList = RxList<dynamic>();
  RxList<String> skillsList = RxList<String>();
  var registerSecurityQuestionValue = "Your mother's maiden name".obs;
  TextEditingController registerAnswerController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final HomeController homeController = Get.find<HomeController>();

  final prefs = Get.find<SharedPreferences>();
  Set<Marker> markers = {};
  var emailTemp = "".obs;
  var company = "".obs;
  RxInt backColor = RxInt(0xFFFFFFFF);
  RxInt fontColor = RxInt(0xFF000000);
  RxBool isClicked = RxBool(false);
  void changeDropdownValue(String value) {
    registerSecurityQuestionValue.value = value;
  }

  void login(BuildContext context) async {
    final loginResponse = await apiRepository.login(
      LoginRequest(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ),
    );
    if (loginResponse['msg'] == 'Successfully signed in.') {
      LoginResponse userInfo = LoginResponse.fromJson(loginResponse);
      await prefs.setString(
          StorageConstants.user, jsonEncode(userInfo.user.toJson()));
      await prefs.setString(StorageConstants.token, userInfo.token);
      await getService();
      await getServiceList();
      // await getAddressLatLng();
      homeController.mainName =
          userInfo.user.firstName + ' ' + userInfo.user.lastName;
      homeController.mainAddress1 = userInfo.user.address1;
      homeController.mainAddress2 = userInfo.user.address2;
      homeController.mainEmail = userInfo.user.email;
      homeController.mainPhone1 = userInfo.user.phone1;
      homeController.mainPhone2 = userInfo.user.phone2;
      refresh();
      CommonWidget.showInfo("Login Successfully!");
      if (userInfo.isFirst == false) {
        homeController.getMain(context);
      } else {
        Get.toNamed(Routes.PROFILE);
      }
    } else if (loginResponse['msg'] == 'User is not verified. Please verify.') {
      CommonWidget.showError("Please verify.");
      emailTemp.value = loginEmailController.text;
      receiveCode(context);
    } else {
      CommonWidget.showError("Please insert correctly.");
    }
    cleanInputs();
  }

  void register(BuildContext context) async {
    List<String> location = registerAddressController.text
        .split(',')
        .map((item) => item.trim())
        .toList();
    final registerResponse = await apiRepository.register(RegisterRequest(
      firstName: registerFirstNameController.text,
      lastName: registerLastNameController.text,
      email: registerEmailController.text,
      password: registerPasswordController.text,
      state: location[location.length - 2],
      city: location[location.length - 3],
      address1: location.length == 4
          ? location[0]
          : location.sublist(0, location.length - 3).join(','),
      phone1: registerPhoneController.text,
      zip: "",
      securityQuestion: registerSecurityQuestionValue.value,
      securityAnswer: registerAnswerController.text,
    ));
    print(registerResponse);
    if (registerResponse!['msg'] == 'User already exists.') {
      CommonWidget.showInfo('User is already existed. Please log in.');
      Get.toNamed(Routes.LOGIN);
    } else {
      CommonWidget.showInfo('Please verify.');
      emailTemp.value = registerEmailController.text;
      receiveCode(context);
    }
  }

  void receiveCode(BuildContext context) async {
    String? code = await apiRepository.receiveCode({'email': emailTemp.value});
    print(code);
    if (code! != "") {
      verifyCodeController.text = '';
      Get.toNamed(Routes.VERIFYCODE);
    }
  }

  void verifyCode(BuildContext context) async {
    final verify = await apiRepository.verifyCode(
        {'email': emailTemp.value, 'code': verifyCodeController.text});
    if (verify['msg'] == "User verified. Please sign in") {
      Get.toNamed(Routes.LOGIN);
    } else {
      CommonWidget.showError('Wrong Code. Please resend email');
    }
    verifyCodeController.text = '';
    cleanInputs();
  }

  void getServiceFilter(String text) {
    filteredServiceList.clear();
    if (text.isEmpty) {
      filteredServiceList.addAll(serviceList);
    } else {
      String searchText = text.toLowerCase();
      for (int i = 0; i < serviceList.length; i++) {
        if (serviceList[i]['servicesProvided']
            .toLowerCase()
            .contains(searchText)) {
          print(i);
          filteredServiceList.add(serviceList[i]);
        }
      }
    }
  }

  Future<void> getAddressLatLng() async {
    for (int i = 0; i < serviceList.length; i++) {
      List<Location> locations =
          await locationFromAddress(serviceList[i]['address']);
      Location location = locations.first;
      markers.add(
        Marker(
            markerId: MarkerId(serviceList[i]['name']),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: serviceList[i]['name'])),
      );
    }
  }

  Future<void> getService() async {
    Map<String, dynamic> service = await apiRepository.getService();
    await prefs.setString(StorageConstants.service, jsonEncode(service));
  }

  Future<void> getServiceList() async {
    serviceList.value =
        jsonDecode(prefs.getString(StorageConstants.service)!)['services'];
    filteredServiceList.addAll(serviceList);
  }

  Future<void> getSkills(
      String skill, String companyName, dynamic color) async {
    isClicked.value = false;
    if (company.value == companyName) {
      if (skillsList.contains(skill) == false && color == 0xFFFFFFFF)
        skillsList.add(skill);
      else
        skillsList.remove(skill);
    } else {
      company.value = companyName;
      skillsList.clear();
      skillsList.add(skill);
    }
  }

  Future<void> postBid(String amount) async {
    print(skillsList);
    if (skillsList.isEmpty == false && amount != "") {
      final bid = await apiRepository.postBid({
        'service': company.value,
        'content': skillsList.join(','),
        'amount': amount
      });
      print(bid);
      if (bid['msg'] == 'Transaction created successfully.') {
        CommonWidget.showInfo('Transaction Success!');
      } else {
        CommonWidget.showError(bid['msg']);
      }
    } else if (skillsList.isEmpty) {
      CommonWidget.showError('Please choose service.');
    } else {
      CommonWidget.showError('Please enter amount.');
    }
    skillsList.clear();
  }

  void cleanInputs() async {
    registerEmailController.clear();
    registerFirstNameController.clear();
    registerLastNameController.clear();
    registerPasswordController.clear();
    registerAnswerController.clear();
    registerPhoneController.clear();
    registerAddressController.clear();
    loginEmailController.clear();
    loginPasswordController.clear();
  }
}
