import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawnflutter/main_widget.dart';
import 'package:lawnflutter/routes/routes.dart';
import 'package:lawnflutter/api/api.dart';
import 'package:lawnflutter/models/models.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var registerSecurityQuestionValue = "Your mother's maiden name".obs;
  TextEditingController registerAnswerController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final prefs = Get.find<SharedPreferences>();
  var emailTemp = "".obs;
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
      refresh();
      CommonWidget.showInfo("Login Successfully!");
      if (userInfo.isFirst == false) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreenWidget(
              name: userInfo.user.firstName + ' ' + userInfo.user.lastName,
              address1: userInfo.user.address1,
              phone1: userInfo.user.phone1,
              phone2: userInfo.user.phone2,
              address2: userInfo.user.address2,
              email: userInfo.user.email,
            ),
          ),
        );
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
