

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MultipleMarker extends StatefulWidget {
  @override
  State<MultipleMarker> createState() => _MultipleMarkerState();
}
class _MultipleMarkerState extends State<MultipleMarker> {

  /// ab yaha par "initial camra position" bata de ge.
  /// "CameraPosition" ye kia karta he ye camra ki tara he camra me hum chize ko dekte he our yaha
  /// par b hum left right dek sakte he . location ko ;
  static final CameraPosition _KPosition= CameraPosition(
    /// ab "camra position k koch parameter he yani property he o set karte he .
      target: LatLng(33.7293882,73.09314610000001),
      zoom: 13
  );

  /// ab yaha par ak list create karte he type ho ga "marker" empty  list;
  final List<Marker> _marker=[];

  /// ab ak our list create karta ho us ka type b marker he . is me me multiple markder add kar sakta ho .
  final List<Marker> _list=[
    /// ab yaha par multiple marker add kare ge.
    const Marker(markerId: MarkerId('1'),
        /// niche jis positino par mark karna chahta ho to positon like ge.
        position: LatLng(33.7293882,73.09314610000001),
        /// is "infowindow" me desciption set kar sakte he .
        infoWindow: InfoWindow(title: "Qaiser"),
        draggable: true,
    ),
    const Marker(markerId: MarkerId('2'),position: LatLng(33.7693882,73.09514610000001),infoWindow: InfoWindow(title: 'Farooq'))
  ];
  /// ab yaha par "controller" create karta ho . ye kia kare ga . ye jassa hhi camra position change ho ga ye
  /// ye controller observe kare ga. view ko .
  Completer<GoogleMapController> _controller=Completer();

  /// ab initstate set karta ho k jase hi app run hota he to ye call ho .

  @override
  initState(){
    super.initState();
    /// ab empty list me me ne multiple marker list add kiye .
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GoogleMap(
          // is maptype see hum type change kar sakte he agr
          mapType: MapType.normal,
          initialCameraPosition:_KPosition,
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

          /// ab agr marker show karna chahe to marker property see show kar sakte he . multiple murker b show kar sakte he .
          /// ab jo upar marker ka list create kia ta o "set" kar de ge
         
          markers: Set.of(_marker),

        )
    );
  }
}
