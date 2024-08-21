import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lawnflutter/component/service_box_widget.dart';
import 'package:lawnflutter/modules/auth/auth_controller.dart';
import 'package:lawnflutter/modules/home/home.dart';
import 'package:lawnflutter/routes/app_pages.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:lawnflutter/shared/constants/colors.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  final controller = Get.find<HomeController>();
  late double latitude = 0;
  late double longitude = 0;
  var authController = Get.find<AuthController>();

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(40.7442419, -73.9886085),
    zoom: 14,
  );
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20, color: ColorConstants.white),
          onPressed: () => Get.toNamed(Routes.MAIN)
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _initialCameraPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: authController.markers,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search,
                  color: ColorConstants.darkGray,
                  size: 26,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: controller.serviceSearchController,
                      style: ThemeConfig.bodyText1.override(
                        color: Color(0xFF3C4858),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Search Anything',
                          alignLabelWithHint: true,
                          labelStyle: ThemeConfig.bodyText1.override(
                            color: Color(0xFFB4B4B4),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          isDense: true),
                      // onChanged: (text) {
                      //   authController.getServiceFilter(text);
                      // },
                      onFieldSubmitted: (text) {
                        authController.getServiceFilter(controller.serviceSearchController.text);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ...authController.filteredServiceList.map((item) {
                  return ServiceBox(
                      companyName: item['name'],
                      ratings: item['rating'],
                      skills: item['servicesProvided'].split(","));
                }).toList(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
