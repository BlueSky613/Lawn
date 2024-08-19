// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';
import 'package:get/get.dart';
import 'package:lawnflutter/routes/routes.dart';

class MainScreenWidget extends StatelessWidget {
  String? address1;
  String? address2;
  String? email;
  String? phone1;
  String? phone2;
  String? name;

  MainScreenWidget(
      {this.name,
      this.address1,
      this.address2,
      this.email,
      this.phone1,
      this.phone2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello $name',
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
            Text('Address1: $address1', style: TextStyle(fontSize: 20.sp)),
            address2 != ""
                ? Text('Address2: $address2', style: TextStyle(fontSize: 20.sp))
                : SizedBox(height: 0),
            Text('Email: $email', style: TextStyle(fontSize: 20.sp)),
            Text('Phone1: $phone1', style: TextStyle(fontSize: 20.sp)),
            phone2 != ""
                ? Text('Phone2: $phone2', style: TextStyle(fontSize: 20.sp))
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
