import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:core';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {




  /// ab yaha par "initial camra position" bata de ge.
  /// "CameraPosition" ye kia karta he ye camra ki tara he camra me hum chize ko dekte he our yaha
  /// par b hum left right dek sakte he . location ko ;
  static final CameraPosition _KPosition= CameraPosition(
    /// ab "camra position k koch parameter he yani property he o set karte he .
      target: LatLng(33.7293882,73.09314610000001),
      zoom: 13
  );

  /// ab yaha par "controller" create karta ho . ye kia kare ga . ye jassa hhi camra position change ho ga ye
  /// ye controller observe kare ga. view ko . ye bahot si chize ka access deta he 
  Completer<GoogleMapController> _controller=Completer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GoogleMap(
          // is maptype see hum type change kar sakte he agr
          mapType: MapType.normal,
          initialCameraPosition:_KPosition,
          // ye hume apne location par le ke jata he 
          myLocationButtonEnabled: true,
          compassEnabled: true,
          zoomControlsEnabled: true,
          /// jab map create hota he to ye "googleMapController" aspect kar raha hota he . our is ka instance hum "completer"
          /// object me denge
          onMapCreated: (GoogleMapController controller){
            /// yaha par competer jo he us ko complete karo konse action see googlemapcontroller k instance see
            _controller.complete(controller);
          },
          // ye kia karta he ye apna location show karta he current location .
          myLocationEnabled: true,
        )
    );
  }
}
