import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawPolygonMap extends StatefulWidget {
  const DrawPolygonMap({super.key});

  @override
  State<DrawPolygonMap> createState() => _DrawPolygonMapState();
}

class _DrawPolygonMapState extends State<DrawPolygonMap> {
  Set<Polygon> polygon=HashSet<Polygon>();
  Completer<GoogleMapController> _controller=Completer();

  List<LatLng> point=[
    LatLng(33.667176, 73.033149),
    LatLng(33.667091, 73.054506),
    LatLng(33.660462, 73.047835),
    LatLng(33.660197, 73.027928),
    LatLng(33.667176, 73.033149),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polygon.add(Polygon(polygonId: PolygonId("1"),points: point,
    fillColor: Colors.amber.withOpacity(0.3),
    geodesic: true,
    strokeColor: Colors.red,
    strokeWidth: 2
    ),
    
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(
        polygons: polygon,
        initialCameraPosition: CameraPosition(target: LatLng(33.667176, 73.033149),
        zoom: 13
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      )
    );
  }
}