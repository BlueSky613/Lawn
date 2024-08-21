import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lawnflutter/modules/auth/auth.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';

class ResetPwdWidget extends StatefulWidget {
  ResetPwdWidget();

  @override
  _ResetPwdWidgetState createState() => _ResetPwdWidgetState();
}

class _ResetPwdWidgetState extends State<ResetPwdWidget> {
  bool passwordVisibility1 = false;
  bool passwordVisibility2 = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var controller = Get.find<AuthController>();
  RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset your password',
                        textAlign: TextAlign.start,
                        style: ThemeConfig.bodyText1.override(
                          color: Color(0xFF3C4858),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: ThemeConfig.bodyText1.override(
                            color: Color(0xFF3C4858),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controller.resetPasswordController,
                        obscureText: !passwordVisibility1,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: ThemeConfig.bodyText1.override(
                            color: Color(0xFF3C4858),
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF3C4858),
                              width: 0.5,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF3C4858),
                              width: 0.5,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility1 = !passwordVisibility1,
                            ),
                            child: Icon(
                              passwordVisibility1
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: ThemeConfig.bodyText1.override(
                          color: Color(0xFF3C4858),
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Requires to insert';
                          }
                          if (val.length < 5) {
                            return 'Requires at least 5 characters';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: Text(
                          'Confirm Password',
                          textAlign: TextAlign.start,
                          style: ThemeConfig.bodyText1.override(
                            color: Color(0xFF3C4858),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controller.confirmPasswordController,
                        obscureText: !passwordVisibility2,
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
                          hintStyle: ThemeConfig.bodyText1.override(
                            color: Color(0xFF3C4858),
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF3C4858),
                              width: 0.5,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF3C4858),
                              width: 0.5,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility2 = !passwordVisibility2,
                            ),
                            child: Icon(
                              passwordVisibility2
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: ThemeConfig.bodyText1.override(
                          color: Color(0xFF3C4858),
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Requires to insert';
                          }
                          if (val.length < 5) {
                            return 'Requires at least 5 characters';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          child: ButtonContinueWidget(labelButton: 'Reset'),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              controller.resetPassword();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  )
                ),
              ),
        ));
  }
}
