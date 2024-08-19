import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lawnflutter/modules/auth/auth.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';

class VerifyScreenWidget extends StatefulWidget {
  VerifyScreenWidget();

  @override
  _VerifyScreenWidgetState createState() => _VerifyScreenWidgetState();
}

class _VerifyScreenWidgetState extends State<VerifyScreenWidget> {
  bool passwordVisibility = false;
  final formKey = GlobalKey<FormState>();
  var controller = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verify with code',
                    textAlign: TextAlign.start,
                    style: ThemeConfig.bodyText1.override(
                      color: Color(0xFF3C4858),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 65, 0, 0),
                    child: Text(
                      'Verification Code',
                      textAlign: TextAlign.start,
                      style: ThemeConfig.bodyText1.override(
                        color: Color(0xFF3C4858),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.verifyCodeController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter your code',
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
                    ),
                    style: ThemeConfig.bodyText1.override(
                      color: Color(0xFF3C4858),
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Requires to insert';
                      }
                      return null;
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.receiveCode(context);
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Text(
                        'Resend Email',
                        textAlign: TextAlign.start,
                        style: ThemeConfig.bodyText1.override(
                          color: ColorConstants.principalColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      child: ButtonContinueWidget(labelButton: 'Confirm'),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.verifyCode(context);
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
