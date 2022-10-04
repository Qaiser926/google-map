import 'package:flutter/material.dart';
import 'package:google_map_tester_app/convert_coordinate_to_address.dart';
import 'package:google_map_tester_app/get_current_location_fromUser.dart';
import 'package:google_map_tester_app/goto_target_place_withbutton.dart';
import 'package:google_map_tester_app/map_app/currentLocation.dart';
import 'package:google_map_tester_app/map_app/find_location_fullAddress.dart';
import 'package:google_map_tester_app/normalMap.dart';
import 'package:google_map_tester_app/search_with_mapApi.dart';
import 'package:google_map_tester_app/set_multiple_marker.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [button(context,"Find address App",(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrentUserLocation()));
          }),
           SizedBox(height: 40,),
           button(context,"Normal Map",(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>NormalMap()));
           }),
            button(context,"Multiple Marker",(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>MultipleMarker()));
           }),  button(context,"Goto Target position with button",(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>GotoTargetPositionWithButton()));
           }), button(context,"Convert coordinate to address",(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ConvertCoordinateToAddress()));
           }), button(context,"goto cuurent location",(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>GetcurrentLocationFromUser()));
           }),  button(context,"Search Data",(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchDataMapApi()));
           }),
          ],
        ),
      ),
    );
  }
  Widget button(context,String title,Function() onpress){
    return  ElevatedButton(onPressed: onpress, child: Text(title));
  }
}
