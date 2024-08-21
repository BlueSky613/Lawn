import 'package:get/get.dart';
import 'package:lawnflutter/modules/home/home.dart';

import 'auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
        () => AuthController(apiRepository: Get.find()));
    Get.lazyPut<HomeController>(
        () => HomeController(apiRepository: Get.find()));
  }
}
