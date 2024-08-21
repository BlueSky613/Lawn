import 'dart:async';
import 'package:lawnflutter/models/models.dart';
import 'package:get/get.dart';
import 'package:lawnflutter/models/request/profile_request.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});
  var storage = Get.find<SharedPreferences>();
  final ApiProvider apiProvider;
  Future<Map<String, dynamic>> login(LoginRequest data) async {
    final res = await apiProvider.login('/user/signin', data);
    print(res.body);
    return res.body;
  }

  Future<Map<String, dynamic>?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/user/signup', data);
    print(res.body);
    return res.body;
  }

  Future<User?> editProfile(ProfileRequest data) async {
    final res = await apiProvider.editProfile('/user/data', data);
    print(res.body);
    CommonWidget.showInfo('Save successfully.');
    return User.fromJson(res.body['updatedUser']);
  }

  Future<String?> receiveCode(Map<String, dynamic> data) async {
    final res = await apiProvider.receiveCode('/user/verify', data);
    print(res.body);
    if (res.body['msg'] == "Code sent.") {
      return res.body['code'].toString();
    } else
      return "";
  }

  Future<Map<String, dynamic>> verifyCode(Map<String, dynamic> data) async {
    final res = await apiProvider.verifyCode('/user/verify', data);
    return res.body;
  }

  Future<Map<String, dynamic>> getService() async {
    final res = await apiProvider.getService('/user/all');
    return res.body;
  }

  Future<Map<String, dynamic>> postBid(Map<String, dynamic> data) async {
    final res = await apiProvider.postBid('/transaction/create', data);
    return res.body;
  }

  Future<Map<String, dynamic>> sendForgotPwd(String email) async {
    final res = await apiProvider.sendForgotPwd('/user/forgotpwd?email=$email');
    return res.body;
  }

  Future<Map<String, dynamic>> postForgotPwd(Map<String, dynamic> data) async {
    final res = await apiProvider.postForgotPwd('/user/forgotpwd', data);
    return res.body;
  }

  Future<Map<String, dynamic>> resetPwd(Map<String, dynamic> data) async {
    final res = await apiProvider.resetPwd('/user/forgotpwd', data);
    return res.body;
  }
}
