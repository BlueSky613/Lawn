// ignore_for_file: must_be_immutable

import 'package:flutter/services.dart';
import 'package:lawnflutter/shared/shared.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ServiceBox extends StatelessWidget {
  String companyName;
  double ratings;
  List<String> skills;
  ServiceBox(
      {required this.companyName, required this.ratings, required this.skills});

  @override
  Widget build(BuildContext context) {
    TextEditingController serviceController = TextEditingController();
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
                  Text(
                    companyName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  RatingBar.builder(
                    initialRating: ratings,
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
              Row(
                children: [
                  for (var skill in skills)
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          skill,
                          style: TextStyle(fontSize: 14),
                        )),
                ],
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
                      border: Border.all(
                        color: Colors.black38,
                        width: 1
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: TextFormField(
                      controller: serviceController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: ThemeConfig.bodyText1.override(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  TextButton(
                      onPressed: () {},
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
