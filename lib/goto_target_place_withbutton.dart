import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GotoTargetPositionWithButton extends StatefulWidget {
  @override
  State<GotoTargetPositionWithButton> createState() => _GotoTargetPositionWithButtonState();
}

class _GotoTargetPositionWithButtonState extends State<GotoTargetPositionWithButton> {
  final CameraPosition _myLocation=CameraPosition(target:LatLng(31.5194, 74.3228),zoom: 13);

  List<Marker> _markerList=[];

 final List<Marker> _list=[
    Marker(markerId:MarkerId('1'), position: LatLng(31.5194, 74.3228),infoWindow: InfoWindow(title: 'My Current Location')),
    Marker(markerId: MarkerId('2'),position: LatLng(24.8607, 67.0011),infoWindow: InfoWindow(title: 'target marker')),
  ];

  @override
  iniState(){
    super.initState();
    _markerList.addAll(_list);
  }

  Completer<GoogleMapController> _controller=Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(

        myLocationEnabled: true,
        mapType: MapType.normal,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        initialCameraPosition: _myLocation,
        markers: Set.of(_markerList),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        /// ab yaha par o position define kare ge jis position par jana chahte he .
        /// niche me ne us controller ko future assign kia he q k ye future see hi aye ga
        GoogleMapController controller=await _controller.future;
        /// googlemapcontroller ka jo controller variable banaya ta us k zarye animatedcamra ko call kia
        /// "animateCamera" is k tro hum camra ko update kare ge.
        controller.animateCamera(
          /// ab yaha par o position define kare ge jis positio par jana chahte he .
          CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(24.8607, 67.0011),zoom: 13)),

        );
        /// location ko update k liye
        setState((){});
      },child: Icon(Icons.location_searching),),
    );
  }
}
