import 'package:lawnflutter/api/base_provider.dart';
import 'package:lawnflutter/models/models.dart';
import 'package:get/get.dart';
import 'package:lawnflutter/models/request/profile_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider extends BaseProvider {
  var storage = Get.find<SharedPreferences>();

  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> editProfile(String path, ProfileRequest data) {
    return put(path, data.toJson(),
        headers: {"Authorization": "${storage.getString('token')}"});
  }

  Future<Response> receiveCode(String path, Map<String, dynamic> data) {
    return post(path, data);
  }

  Future<Response> verifyCode(String path, Map<String, dynamic> data) {
    return put(path, data);
  }

  Future<Response> getService(String path) {
    return get(path,
        headers: {"Authorization": "${storage.getString('token')}"});
  }

  Future<Response> postBid(String path, Map<String, dynamic> data) {
    return post(path, data,
        headers: {"Authorization": "${storage.getString('token')}"});
  }
}
