import 'package:get/get.dart';
import 'package:lawnflutter/api/api_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
        HomeController(apiRepository: Get.find<ApiRepository>()));
  }
}
