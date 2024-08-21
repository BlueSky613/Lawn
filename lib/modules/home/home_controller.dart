import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:lawnflutter/models/request/profile_request.dart';
import 'package:lawnflutter/api/api.dart';
import 'package:lawnflutter/models/models.dart';
import 'package:lawnflutter/routes/app_pages.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  TextEditingController serviceSearchController = TextEditingController();
  TextEditingController ProfileFirstNameController = TextEditingController();
  TextEditingController ProfileLastNameController = TextEditingController();
  TextEditingController ProfileEmailController = TextEditingController();
  TextEditingController ProfileAddress1Controller = TextEditingController();
  TextEditingController ProfileAddress2Controller = TextEditingController();
  TextEditingController ProfileCityController = TextEditingController();
  TextEditingController ProfileStateController = TextEditingController();
  TextEditingController ProfileZipController = TextEditingController();
  TextEditingController ProfilePhone1Controller = TextEditingController();
  TextEditingController ProfilePhone2Controller = TextEditingController();
  String mainName = "";
  String mainEmail = "";
  String mainAddress1 = "";
  String mainAddress2 = "";
  String mainPhone1 = "";
  String mainPhone2 = "";

  HomeController({required this.apiRepository});

  final prefs = Get.find<SharedPreferences>();
  Future<User?> loadUser() async {
    String? jsonString = prefs.getString('user');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return User.fromJson(jsonMap);
    }
    return null;
  }

  Future<void> getProfile() async {
    User? profile = await loadUser();
    if (profile != null) {
      ProfileFirstNameController.text = profile.firstName;
      ProfileLastNameController.text = profile.lastName;
      ProfileEmailController.text = profile.email;
      ProfileAddress1Controller.text = profile.address1;
      ProfileAddress2Controller.text = profile.address2;
      ProfileCityController.text = profile.city;
      ProfileStateController.text = profile.state;
      ProfileZipController.text = profile.zip;
      ProfilePhone1Controller.text = profile.phone1;
      ProfilePhone2Controller.text = profile.phone2;
      update();
    }
  }

  void getMain(BuildContext context) async {
    User? userInfo = await loadUser();
    if (userInfo != null) {
      mainName = userInfo.firstName + ' ' + userInfo.lastName;
      mainAddress1 = userInfo.address1;
      mainPhone1 = userInfo.phone1;
      mainPhone2 = userInfo.phone2;
      mainAddress2 = userInfo.address2;
      mainEmail = userInfo.email;
      Get.toNamed(Routes.MAIN);
    }
  }

  void editProfile(BuildContext context) async {
    User? profile = await apiRepository.editProfile(ProfileRequest(
        firstName: ProfileFirstNameController.text,
        lastName: ProfileLastNameController.text,
        email: ProfileEmailController.text,
        address1: ProfileAddress1Controller.text,
        address2: ProfileAddress2Controller.text,
        phone1: ProfilePhone1Controller.text,
        phone2: ProfilePhone2Controller.text,
        city: ProfileCityController.text,
        state: ProfileStateController.text,
        zip: ProfileZipController.text));
    await prefs.setString(StorageConstants.user, jsonEncode(profile!.toJson()));
  }

  void cleanInputs() async {
    serviceSearchController.clear();
  }
}
