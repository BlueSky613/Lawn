// ignore_for_file: must_be_immutable

import 'package:flutter/services.dart';
import 'package:lawnflutter/modules/auth/auth.dart';
import 'package:lawnflutter/routes/app_pages.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lawnflutter/component/skill_box_widget.dart';

class ServiceBox extends StatefulWidget {
  String companyName;
  double ratings;
  List<String> skills;
  ServiceBox(
      {required this.companyName, required this.ratings, required this.skills});

  _ServiceBoxState createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {
  final TextEditingController _serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var controller = Get.find<AuthController>();

    return Card(
        margin: EdgeInsets.only(bottom: 10.0),
        color: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: .8,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: Text(
                      widget.companyName,
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: widget.ratings,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var skill in widget.skills)
                      SkillBoxWidget(
                          skill: skill,
                          fontSize: 10,
                          company: widget.companyName)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '\$',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextFormField(
                      controller: _serviceController,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: ThemeConfig.bodyText1.override(fontSize: 14),
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allow only digits
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  TextButton(
                      onPressed: () async {
                        controller.postBid(_serviceController.text);
                        Get.back();
                        Get.toNamed(Routes.SERVICEPROVIDER);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ColorConstants.principalColor),
                      child: Text(
                        "Bid",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
