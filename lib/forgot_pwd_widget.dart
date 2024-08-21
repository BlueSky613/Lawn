import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lawnflutter/modules/auth/auth.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';

class ForgotPWdWidget extends StatefulWidget {
  ForgotPWdWidget();

  @override
  _ForgotPWdWidgetState createState() => _ForgotPWdWidgetState();
}

class _ForgotPWdWidgetState extends State<ForgotPWdWidget> {
  bool passwordVisibility = false;
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
          title: Text('Forgot Password',
              style: TextStyle(color: ColorConstants.white, fontSize: 20)),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Text(
                      'Email',
                      textAlign: TextAlign.start,
                      style: ThemeConfig.bodyText1.override(
                        color: Color(0xFF3C4858),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Text(
                      controller.forgotEmail,
                      textAlign: TextAlign.start,
                      style: ThemeConfig.bodyText1.override(
                        color: Color(0xFF3C4858),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Text(
                      'Security Question',
                      textAlign: TextAlign.start,
                      style: ThemeConfig.bodyText1.override(
                        color: Color(0xFF3C4858),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Text(
                      controller.securityQuestion,
                      textAlign: TextAlign.start,
                      style: ThemeConfig.bodyText1.override(
                        color: Color(0xFF3C4858),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Text(
                      'Security Answer',
                      textAlign: TextAlign.start,
                      style: ThemeConfig.bodyText1.override(
                        color: Color(0xFF3C4858),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.securityAnswerController,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      hintText: 'Input your answer',
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
                          () => passwordVisibility = !passwordVisibility,
                        ),
                        child: Icon(
                          passwordVisibility
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
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      child: ButtonContinueWidget(labelButton: 'Confirm'),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          controller.postForgotPwd();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
