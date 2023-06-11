import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchDataMapApi extends StatefulWidget {
  const SearchDataMapApi({Key? key}) : super(key: key);

  @override
  State<SearchDataMapApi> createState() => _SearchDataMapApiState();
}

class _SearchDataMapApiState extends State<SearchDataMapApi> {
  // ye niche controller value ko stroe karta he jab b user kio value enter karta he to o is me store ho gi
  TextEditingController _controller=TextEditingController();
  // store user device id
  var uuid=Uuid();
  var sessionToken='123435';
  List<dynamic> mapList=[];
  String error='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // yaha par controller ki value listne karte he 
    _controller.addListener(() {
      onChange();
    });
  }
  onChange()async{
    if(sessionToken==null){
      setState(() {
        sessionToken=uuid.v4();
      });
    }
    getSession(_controller.text);
  }
  getSession(String input) async{
    String kPlaceApi="AIzaSyDrAGEjzzwaV0cfeClhdsw4FEGWarGOV34";
    String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
   String request= '$baseURL?input=$input&key=$kPlaceApi&sessiontoken=$sessionToken';

    var resp= await http.get(Uri.parse(request));
    Fluttertoast.showToast(msg: resp.body.toString());
    log("message : ${resp.body.toString()}");
    if(resp.statusCode==200){
    setState(() {
        mapList=jsonDecode(resp.body.toString());
      
    });
    }else{
      throw Exception("Failed to Load");
    }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: Container(
      child: Column(
        children: [
          TextFormField(
            // ab yaha par controller do ga k jasa hi value enter ho gi to o us me sotre ho jaye
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Search Value",
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: mapList.length,
            itemBuilder: (context,index){
              return ListTile(
                onTap: ()async{
                  List<Location> address=await locationFromAddress(mapList[index]['description']);
                log(address.toString());
                },
                title: Text(mapList[index]["description"]),
                
              );
            },
          ))
        ],
      ),
    ),
    );
  }
}
