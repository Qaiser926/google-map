import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetcurrentLocationFromUser extends StatefulWidget {
  const GetcurrentLocationFromUser({Key? key}) : super(key: key);

  @override
  State<GetcurrentLocationFromUser> createState() => _GetcurrentLocationFromUserState();
}

class _GetcurrentLocationFromUserState extends State<GetcurrentLocationFromUser> {

  final String name="";

  /// set postion
  final CameraPosition _initialPosition=CameraPosition(target: LatLng(33.0231753 , 70.7048707),zoom: 14);
  Completer<GoogleMapController> controller=Completer();

  /// set marker with latlang
  List<Marker> _marker=[
    Marker(markerId: MarkerId('1'),position: LatLng(33.0231753 , 70.7048707),infoWindow: InfoWindow(title: 'USTB')),
  ];

  Completer<GoogleMapController> _controller=Completer();

  /// "Position" is latlang our koch nhe hamara address he
  Future<Position> GotoCurrentLocation() async{
    /// yaha niche permision check kare ga agr anable kar diya to he otherwise eerror de ga
    Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace){
      print("error occurs"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  initState(){
    super.initState();
    // load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        markers: Set<Marker>.of(_marker),
        myLocationEnabled: true,
        /// jab is ki practice kar raha to current location change nhe ho raha to socha q .
        /// me ne ye niche "onmapcreated" nhe lika ta . controller ka kam view ko observe karna he .
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        /// agr chahe to dirct b current location ko get kar sakte is ko initstate me set kar le ge.
load();
       /// agr current location button k zarye get karna he to load method ko call karo yaha par

      },child: Icon(Icons.location_searching),),
    );
  }
  load(){
    GotoCurrentLocation().then((value) async{

      /// ab yaha par marker set kar diya
      _marker.add(Marker(markerId: MarkerId('2'),position: LatLng(value.latitude,value.longitude),infoWindow: InfoWindow(title: "My current Location is")));

      /// ab yaha par cameraposition define kia yaha par jaye ga.
      CameraPosition cameraPosition=CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 13);

      /// ab marker to set kar diya but change nhe hoga q k camera position set nhe kia he
      /// ab ye controller view ko change kare ga . yani camera ko change kare ga.
      final GoogleMapController controller=await _controller.future;

      /// ab camera positoin ko update kare ge.
      /// "animateCamera" jab cemera ko update kare ge to ye like ge.
      /// "CameraUpdate" our ye animatedcemra me set kare ge.
      controller.animateCamera(CameraUpdate.newCameraPosition(
          cameraPosition
      ));
      setState((){

      });
      print("my postion is :"+ value.latitude.toString()+ " "+ value.longitude.toString());
    });
  }
}
