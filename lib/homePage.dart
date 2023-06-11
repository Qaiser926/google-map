// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_map_tester_app/convert_coordinate_to_address.dart';
import 'package:google_map_tester_app/customMarker.dart';
import 'package:google_map_tester_app/draw_polygone_map.dart';
import 'package:google_map_tester_app/get_current_location_fromUser.dart';
import 'package:google_map_tester_app/goto_target_place_withbutton.dart';
import 'package:google_map_tester_app/map_app/currentLocation.dart';
import 'package:google_map_tester_app/map_style.dart';
import 'package:google_map_tester_app/networkImage.dart';
import 'package:google_map_tester_app/only_google_map.dart';
import 'package:google_map_tester_app/poyline.dart';
import 'package:google_map_tester_app/search_with_mapApi.dart';
import 'package:google_map_tester_app/set_multiple_marker.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87,),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [button(context,"Check Current Address",(){
              Navigator.push(context, MaterialPageRoute(
                
                builder: (context)=>const CurrentUserLocation()));
            }),
            //  SizedBox(height: 40,),
             button(context,"Only show google map",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Map()));
             }),
              button(context,"Multiple Marker",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MultipleMarker()));
             }),  button(context,"Goto Target position with button",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>GotoTargetPositionWithButton()));
             }), button(context,"Convert coordinate to address",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ConvertCoordinateToAddress()));
             }), button(context,"goto cuurent location",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>GetcurrentLocationFromUser()));
             }), 
              button(context,"Search Data",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchDataMapApi()));
             }),
              button(context,"Custom Marker",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomMarker()));
             }),
               button(context,"DrawPolygonMap",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawPolygonMap()));
             }),
               button(context,"PolyLine",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>PolyLine()));
             }),
              button(context,"Set Image with marker ",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>NetworkImagePage()));
             }),
                button(context,"MapStyle ",(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MapStyle()));
             }),
             
            ],
          ),
        ),
      ),
    );
  }
  Widget button(context,String title,Function() onpress){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: double.infinity-40,
        color: Colors.black54,
        onPressed: onpress, child: Text(title,style: const TextStyle(color: Colors.white),)),
    );
  }
}
