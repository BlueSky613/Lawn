import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:lawnflutter/main_widget.dart';
import 'package:lawnflutter/models/request/profile_request.dart';
import 'package:lawnflutter/routes/routes.dart';
import 'package:lawnflutter/api/api.dart';
import 'package:lawnflutter/models/models.dart';
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

  void goMain(BuildContext context) async {
    User? profile = await loadUser();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreenWidget(
          name: profile!.firstName + ' ' + profile.lastName,
          address1: profile.address1,
          phone1: profile.phone1,
          phone2: profile.phone2,
          address2: profile.address2,
          email: profile.email,
        ),
      ),
    );
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

  Future<void> getServiceFilter() async {}

  void cleanInputs() async {
    serviceSearchController.clear();
  }
}
