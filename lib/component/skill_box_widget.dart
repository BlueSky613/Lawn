// ignore_for_file: must_be_immutable

import 'package:get/get.dart';
import 'package:lawnflutter/modules/auth/auth.dart';
import 'package:flutter/material.dart';

class SkillBoxWidget extends StatefulWidget {
  String skill;
  double fontSize;
  String company;
  SkillBoxWidget({
    this.skill = 'Enter',
    this.fontSize = 16,
    this.company = "",
  });
  _SkillBoxWidgetState createState() => _SkillBoxWidgetState();
}

class _SkillBoxWidgetState extends State<SkillBoxWidget> {
  var backColor = 0xFFFFFFFF;
  var fontColor = 0xFF000000;
  var controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(10),
      child: Container(
        height: 20,
        constraints: BoxConstraints(
          maxHeight: 40,
        ),
        decoration: BoxDecoration(
          color: Color(backColor),
        ),
        child: GestureDetector(
          child: Text(
            widget.skill,
            style: TextStyle(fontSize: 14, color: Color(fontColor)),
          ),
          onTap: () {
            setState(() {
              if (fontColor == 0xFF000000) {
                backColor = 0xFF2A3CC5;
                fontColor = 0xFFFFFFFF;
              } else {
                backColor = 0xFFFFFFFF;
                fontColor = 0xFF000000;
              }
            });
            controller.getSkills(widget.skill, widget.company, fontColor);
          },
        ),
      ),
    );
  }
}
