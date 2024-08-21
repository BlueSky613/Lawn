import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lawnflutter/modules/auth/auth.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/routes/routes.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';

class LoginScreenWidget extends StatefulWidget {
  LoginScreenWidget();

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
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
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Obx(
                () => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in with my account',
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
                          'Email',
                          textAlign: TextAlign.start,
                          style: ThemeConfig.bodyText1.override(
                            color: Color(0xFF3C4858),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controller.loginEmailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
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
                          if (val.length < 5) {
                            return 'Requires at least 5 characters';
                          }
                          if (!regExp.hasMatch(val)) {
                            return 'Insert in correct format';
                          }
                          return null;
                        },
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
                        controller: controller.loginPasswordController,
                        obscureText: !passwordVisibility,
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
                          if (val.length < 5) {
                            return 'Requires at least 5 characters';
                          }
                          return null;
                        },
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Text(
                            'Forgot Password',
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
                          child: ButtonContinueWidget(labelButton: 'Enter'),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate() &&
                                controller.isLoading.value == false) {
                              setState(() {
                                controller.isLoading.value = true;
                              });
                              controller.login(context);
                            }
                          },
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            if (controller.isLoading.value == false) {
                              Get.toNamed(Routes.REGISTER);
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 60,
                                  constraints: BoxConstraints(
                                    maxHeight: 40,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: ColorConstants.principalColor,
                                      width: .5,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Register',
                                      textAlign: TextAlign.center,
                                      style: ThemeConfig.bodyText1.override(
                                        color: ColorConstants.principalColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 20),
                      controller.isLoading == true.obs
                          ? Container(
                              child: CircularProgressIndicator(
                                color: ColorConstants.principalColor,
                              ),
                              alignment: Alignment.center,
                            )
                          : SizedBox(
                              height: 20,
                            )
                    ],
                  ),
                ),
              )),
        ));
  }
}
