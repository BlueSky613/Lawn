import 'package:get/get.dart';
import 'package:lawnflutter/component/dropdown_google_places.dart';
import 'package:lawnflutter/modules/auth/auth_controller.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreenWidget extends GetView<AuthController> {
  final FocusScopeNode _node = FocusScopeNode();
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return CommonWidget.getScreenSizeFontFixed(
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: FocusScope(
            node: _node,
            child: Form(
              key: formKey,
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                controller: _scrollController,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lawn",
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
                            'FirstName',
                            textAlign: TextAlign.start,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: controller.registerFirstNameController,
                            keyboardType: TextInputType.emailAddress,
                            onEditingComplete: _node.nextFocus,
                            validator: (val) {
                              if (val!.isEmpty) {
                                _scrollController.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                                return 'Requires to insert';
                              }
                              return null;
                            },
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your firstName',
                                labelStyle: ThemeConfig.bodyText1.override(
                                  color: Color(0xFFB4B4B4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(),
                                isDense: true,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 0.7)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFB4B4B4), width: 0.7))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: Text(
                            'LastName',
                            textAlign: TextAlign.start,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: controller.registerLastNameController,
                            keyboardType: TextInputType.emailAddress,
                            onEditingComplete: _node.nextFocus,
                            validator: (val) {
                              if (val!.isEmpty) {
                                _scrollController.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                                return 'Requires to insert';
                              }
                              return null;
                            },
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your lastName',
                                labelStyle: ThemeConfig.bodyText1.override(
                                  color: Color(0xFFB4B4B4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(),
                                isDense: true,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 0.7)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFB4B4B4), width: 0.7))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: controller.registerEmailController,
                            keyboardType: TextInputType.emailAddress,
                            onEditingComplete: _node.nextFocus,
                            validator: (val) {
                              if (val!.isEmpty) {
                                _scrollController.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                                return 'Requires to insert';
                              }
                              if (val.length < 5) {
                                _scrollController.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                                return 'Requires at least 5 characters';
                              }
                              if (!Regex.isEmail(val)) {
                                _scrollController.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                                return 'Insert in correct format';
                              }
                              return null;
                            },
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your email',
                                labelStyle: ThemeConfig.bodyText1.override(
                                  color: Color(0xFFB4B4B4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(),
                                isDense: true,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 0.7)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFB4B4B4), width: 0.7))),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            obscureText: true,
                            controller: controller.registerPasswordController,
                            onEditingComplete: _node.nextFocus,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Requires to insert';
                              }
                              if (val.length < 5) {
                                return 'Requires at least 5 characters';
                              }
                              return null;
                            },
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your password',
                                labelStyle: ThemeConfig.bodyText1.override(
                                  color: Color(0xFFB4B4B4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(),
                                isDense: true,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 0.7)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFB4B4B4), width: 0.7))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: Text(
                            'Address',
                            textAlign: TextAlign.start,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DropDownGooglePlaces(
                          type: 'register',
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),    
                          child: Text(
                            'Phone Number',
                            textAlign: TextAlign.start,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InternationalPhoneNumberInput(
                          textStyle: TextStyle(color: Colors.black),
                          onInputChanged: (PhoneNumber number) {
                            controller.registerPhoneController.text =
                                number.phoneNumber.toString();
                          },
                          initialValue: PhoneNumber(
                            isoCode: Platform.localeName.split('_').last,
                          ),
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          formatInput: true,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            controller.registerPhoneController.text =
                                number.phoneNumber.toString();
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: Text(
                            'Security Question',
                            textAlign: TextAlign.start,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Obx(() => DropdownButton<String>(
                                value: controller
                                    .registerSecurityQuestionValue.value,
                                onChanged: (String? newValue) {
                                  controller.changeDropdownValue(newValue!);
                                },
                                items: <String>[
                                  "Your mother's maiden name",
                                  "Your first pet's name",
                                  "The name of your elementary school",
                                  "Your best friend's nickname",
                                  "Your favorite sports team",
                                  "The city where you first met your spouse"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: Text(
                            'Security Answer',
                            textAlign: TextAlign.start,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: controller.registerAnswerController,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
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
                            decoration: InputDecoration(
                                labelText: 'Enter your answer',
                                labelStyle: ThemeConfig.bodyText1.override(
                                  color: Color(0xFFB4B4B4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(),
                                isDense: true,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 0.7)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFB4B4B4), width: 0.7))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                controller.register(context);
                              }
                            },
                            child:
                                ButtonContinueWidget(labelButton: 'Register'),
                          ),
                        ),
                        SizedBox(height: 200)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
