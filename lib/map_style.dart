// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapStyle extends StatefulWidget {
  const MapStyle({super.key});

  @override
  State<MapStyle> createState() => _MapStyleState();
}

class _MapStyleState extends State<MapStyle> {
  String maptheme='';
  Completer<GoogleMapController> _controller=Completer();

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DefaultAssetBundle.of(context).loadString("assets/maptheme/silver_theme.json").then((value){
      maptheme=value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context)=>[
              PopupMenuItem(
                onTap: (){
                _controller.future.then((value) {
                    DefaultAssetBundle.of(context).loadString("assets/maptheme/silver_theme.json").then((string) {
                    value.setMapStyle(string);
                  });
                });
                },
                child: Text("Silver"),
              ),
                PopupMenuItem(
                onTap: (){
                    _controller.future.then((value) {
                    DefaultAssetBundle.of(context).loadString("assets/maptheme/night_theme.json").then((string) {
                    value.setMapStyle(string);
                  });
                });
                },
                child: Text("Night"),
              ),
                PopupMenuItem(
                onTap: (){
                    _controller.future.then((value) {
                    DefaultAssetBundle.of(context).loadString("assets/maptheme/aubergin_theme.json").then((string) {
                    value.setMapStyle(string);
                  });
                });
                },
                child: Text("Aubergin"),
              ),
              PopupMenuItem(
                onTap: (){
                    _controller.future.then((value) {
                    DefaultAssetBundle.of(context).loadString("assets/maptheme/retro_theme.json").then((string) {
                    value.setMapStyle(string);
                  });
                });
                },
                child: Text("Retro"),
              ),
            ]
          )
        ],
      ),
      body:GoogleMap(
        initialCameraPosition: const CameraPosition(target: LatLng(33.667176, 73.033149),
        zoom: 13
        ),
        onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(maptheme);
          _controller.complete(controller);
        },
      )
    );
  }
}