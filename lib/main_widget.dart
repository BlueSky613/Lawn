// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:lawnflutter/modules/home/home.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';
import 'package:get/get.dart';
import 'package:lawnflutter/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreenWidget extends StatelessWidget {
  var controller = Get.find<HomeController>();

  MainScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${controller.mainName}',
            style: TextStyle(color: ColorConstants.white, fontSize: 20.sp)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20, color: ColorConstants.white),
          onPressed: () => Get.toNamed(Routes.LOGIN),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Please confirm your details:',
              style: TextStyle(fontSize: 25.sp),
            ),
            SizedBox(
              height: 50,
            ),
            Text('Address1: ${controller.mainAddress1}',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20.sp)),
            controller.mainAddress2 != ""
                ? Text('Address2: ${controller.mainAddress2}',
                    style: TextStyle(fontSize: 20.sp))
                : SizedBox(height: 0),
            Text('Email: ${controller.mainEmail}',
                style: TextStyle(fontSize: 20.sp)),
            Text('Phone1: ${controller.mainPhone1}',
                style: TextStyle(fontSize: 20.sp)),
            controller.mainPhone2 != ""
                ? Text('Phone2: ${controller.mainPhone2}',
                    style: TextStyle(fontSize: 20.sp))
                : SizedBox(height: 0),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.SERVICEPROVIDER);
                },
                child:
                    ButtonContinueWidget(labelButton: 'See Service Provider'),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: ButtonContinueWidget(labelButton: 'Edit Profile'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
