import 'package:get/get.dart';
import 'package:lawnflutter/component/button_continue_widget.dart';
import 'package:lawnflutter/modules/home/home.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfileScreenWidget extends GetView<HomeController> {
  final FocusScopeNode _node = FocusScopeNode();
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    controller.getProfile();

    return CommonWidget.getScreenSizeFontFixed(
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
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
                          "Profile",
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
                            controller: controller.ProfileFirstNameController,
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
                            controller: controller.ProfileLastNameController,
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
                            controller: controller.ProfileEmailController,
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
                            'Address1',
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
                            controller: controller.ProfileAddress1Controller,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your address',
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
                            'Address2',
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
                            controller: controller.ProfileAddress2Controller,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your address',
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
                            'City',
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
                            controller: controller.ProfileCityController,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your city',
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
                            'State',
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
                            controller: controller.ProfileStateController,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your state',
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
                            'ZIP',
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
                            controller: controller.ProfileZipController,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your zip',
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
                            'Phone1',
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
                            controller: controller.ProfilePhone1Controller,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your phone number',
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
                            'Phone2',
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
                            controller: controller.ProfilePhone2Controller,
                            onEditingComplete: _node.nextFocus,
                            style: ThemeConfig.bodyText1.override(
                              color: Color(0xFF3C4858),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Enter your phone number',
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
                              controller.editProfile(context);
                            },
                            child: ButtonContinueWidget(labelButton: 'Save'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: InkWell(
                            onTap: () {
                              controller.goMain(context);
                            },
                            child: ButtonContinueWidget(
                                labelButton: 'Contact Info'),
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
