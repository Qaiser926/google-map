import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLine extends StatefulWidget {
  const PolyLine({super.key});

  @override
  State<PolyLine> createState() => _PolyLineState();
}

class _PolyLineState extends State<PolyLine> {
  CameraPosition cameraPosition=CameraPosition(target: LatLng(33.660197, 73.027928),
  zoom: 13
  );
  Completer<GoogleMapController> _controller=Completer();

  Set<Marker> marker={};
   Set<Polyline> _polyLin={};

List<LatLng> latlng=[
  LatLng(33.660197, 73.027928),
  LatLng(33.666844, 73.047636),
  LatLng(33.659966, 73.046643),
  LatLng(33.672003, 73.037425),
  LatLng(33.671871, 73.049981),
  LatLng(33.662413, 73.058126),
];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var i=0; i<latlng.length;i++){
      marker.add(Marker(markerId:MarkerId( i.toString()),
      infoWindow: InfoWindow(
        title: "Islamabad Location",
        snippet: "Qaiser"
      ),
      icon: BitmapDescriptor.defaultMarker
      ));
      setState(() {
        
      });
     _polyLin.add(
    Polyline(polylineId: PolylineId("1"),
    color: Colors.amber,
    points: latlng
    )
     );
    }
    
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        polylines: _polyLin,
        myLocationEnabled: true,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

        },
      ),
    );
  }
}