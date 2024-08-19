import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lawnflutter/component/service_box_widget.dart';
import 'package:lawnflutter/modules/home/home.dart';
import 'package:lawnflutter/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lawnflutter/shared/constants/colors.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  late Position _currentPosition;
  final Set<Marker> _markers = {};
  final controller = Get.find<HomeController>();
  late double latitude = 0;
  late double longitude = 0;

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(40.7442419, -73.9886085),
    zoom: 14,
  );

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentPosition = position;
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: 'My Location'),
        ),
      );

      _controller?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ),
      );
    });
  }

  void getAddressLatLng(String address) async {
    List<Location> locations = await locationFromAddress(address);
    Location location = locations.first;
    LatLng latLng = LatLng(location.latitude, location.longitude);

    print('Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}');
    setState(() {
      latitude = latLng.latitude;
      longitude = latLng.longitude;
    });
  }

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
    getAddressLatLng('230 Fifth Rooftop Bar, Broadway, New York, NY, USA');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              markers: {
                Marker(
                  markerId: MarkerId('myLocation1'),
                  position: LatLng(latitude, longitude),
                  infoWindow: InfoWindow(title: 'My Location1'),
                ),
              },
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
                      onChanged: (text) {},
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
                SizedBox(height: 10,),
                ServiceBox(
                    companyName: "Good Company",
                    ratings: 4.5,
                    skills: ['Gardening', 'Cleaning']),
                ServiceBox(
                    companyName: "Good Company",
                    ratings: 4.5,
                    skills: ['Gardening', 'Cleaning']),
                ServiceBox(
                    companyName: "Good Company",
                    ratings: 4.5,
                    skills: ['Gardening', 'Cleaning']),
                ServiceBox(
                    companyName: "Good Company",
                    ratings: 4.5,
                    skills: ['Gardening', 'Cleaning']),
                ServiceBox(
                    companyName: "Good Company",
                    ratings: 4.5,
                    skills: ['Gardening', 'Cleaning']),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
