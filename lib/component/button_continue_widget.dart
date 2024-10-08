// ignore_for_file: must_be_immutable

import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonContinueWidget extends StatelessWidget {
  String labelButton;
  double fontSize;
  ButtonContinueWidget({this.labelButton = 'Enter', this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Container(
        height: 60,
        constraints: BoxConstraints(
          maxHeight: 40,
        ),
        decoration: BoxDecoration(
          color: ColorConstants.principalColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            labelButton,
            textAlign: TextAlign.center,
            style: ThemeConfig.bodyText1.override(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
