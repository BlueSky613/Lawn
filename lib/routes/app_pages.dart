import 'package:get/get.dart';
import 'package:lawnflutter/forgot_pwd_widget.dart';
import 'package:lawnflutter/login_widget.dart';
import 'package:lawnflutter/main_widget.dart';
import 'package:lawnflutter/profile_widget.dart';
import 'package:lawnflutter/register_widget.dart';
import 'package:lawnflutter/modules/auth/auth.dart';
import 'package:lawnflutter/reset_pwd_widget.dart';
import 'package:lawnflutter/user_service_widget.dart';
import 'package:lawnflutter/modules/home/home.dart';
import 'package:lawnflutter/verify_widget.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      binding: AuthBinding(),
      page: () => LoginScreenWidget(),
    ),
    GetPage(
      name: Routes.REGISTER,
      binding: AuthBinding(),
      page: () => RegisterScreenWidget(),
    ),
    GetPage(
        name: Routes.SERVICEPROVIDER,
        bindings: [HomeBinding(), AuthBinding()],
        page: () => MapScreen()),
    GetPage(
        name: Routes.VERIFYCODE,
        binding: AuthBinding(),
        page: () => VerifyScreenWidget()),
    GetPage(
        name: Routes.PROFILE,
        binding: HomeBinding(),
        page: () => ProfileScreenWidget()),
    GetPage(
        name: Routes.MAIN,
        binding: HomeBinding(),
        page: () => MainScreenWidget()),
    GetPage(
        name: Routes.FORGORTPWD,
        binding: AuthBinding(),
        page: () => ForgotPWdWidget()),
    GetPage(
        name: Routes.RESETPWD,
        binding: AuthBinding(),
        page: () => ResetPwdWidget())
  ];
}
