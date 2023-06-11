// ignore_for_file: unused_field, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends StatefulWidget {
  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  final List<Marker> _marker = [];

  final List<LatLng> latLong = [
    LatLng(33.6491, 73.0833),
    LatLng(33.6428, 73.0706),
    LatLng(33.6503, 73.0778),
    LatLng(33.5700194, 73.1308291),
  ];
  List<String> image = [
    "images/bycicle.png",
    "images/car.png",
    "images/car1.png",
    "images/sport_car.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load() {
    for (var i = 0; i < latLong.length; i++) {
      _marker.add(Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: latLong[i],
          onTap: () {
            customInfoWindowController.addInfoWindow!(
                Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage( "https://media.istockphoto.com/id/909328686/photo/tasty-meat-rolls-with-sour-cream-and-salad-on-wooden-table.webp?s=1024x1024&w=is&k=20&c=dVBmd5hfO36qQctgk202VUyF6zuX19mV1KM-rVUvLC8=",
                     ),   fit: BoxFit.fitWidth,
                        filterQuality: FilterQuality.high,),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                        ),
                  ),
                latLong[i]);
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: (position) {
              customInfoWindowController.onCameraMove!();
            },
            onTap: (position) {
              customInfoWindowController.hideInfoWindow!();
            },
            myLocationButtonEnabled: true,
            markers: Set.of(_marker),
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: LatLng(33.6508, 73.0741), zoom: 13),
            onMapCreated: (GoogleMapController controller) {
              customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            offset: 30,
            height: 200,
            width: 300,
            controller: customInfoWindowController,
          )
        ],
      ),
    );
  }
}
