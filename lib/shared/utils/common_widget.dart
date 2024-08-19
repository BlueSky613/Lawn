import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawnflutter/theme/theme.dart';

class CommonWidget {
  static void showError(String body, {String title = 'Error'}) async {
    Get.snackbar(title, body,
        titleText: Text(
          title,
          textScaleFactor: 1,
          style: ThemeConfig.title3.override(color: Colors.white),
        ),
        messageText: Text(
          body,
          textScaleFactor: 1,
          style: ThemeConfig.subtitle2.override(color: Colors.white),
        ),
        icon: Icon(
          Icons.error_outline_rounded,
          size: 28.0,
          color: Colors.white,
        ),
        duration: Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: Colors.red);
  }

  static void showInfo(String body,
      {String title = 'Info', color = Colors.green}) async {
    Get.snackbar(title, body,
        titleText: Text(
          title,
          style: ThemeConfig.title3.override(color: Colors.white),
        ),
        messageText: Text(
          body,
          style: ThemeConfig.subtitle2.override(color: Colors.white),
        ),
        icon: Icon(
          Icons.error_outline_rounded,
          size: 28.0,
          color: Colors.white,
        ),
        duration: Duration(seconds: 5),
        colorText: Colors.blue[400],
        backgroundColor: color);
  }

  static getScreenSizeFontFixed(Widget screen) {
    return MediaQuery(
        data: MediaQuery.of(Get.context!).copyWith(textScaleFactor: 1),
        child: screen);
  }
}
