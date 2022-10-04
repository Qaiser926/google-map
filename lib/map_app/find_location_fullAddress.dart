

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_map_tester_app/map_app/currentLocation.dart';

class FindLocationFullAddress extends StatefulWidget {

  @override
  State<FindLocationFullAddress> createState() => _FindLocationFullAddressState();
}

class _FindLocationFullAddressState extends State<FindLocationFullAddress> {
  String name='';
  var streetAddress='';
  var localityName='';
  var throughfare='';
  var administrativeAreaname='';
  var postalcode='';
  var isoCountrycode='';
  var sublocality='';
  var subThoroughFare='';
  var subadminstrationarea='';
  var country='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.55,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name :        "),
                            Text(     name,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text("Street Address:"),
                            Text(streetAddress,textAlign: TextAlign.justify,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700,),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Locality:         '),
                            Text(localityName,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Through Fare :      '),
                            Text(throughfare,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Administrative Area :        '),
                      Text(administrativeAreaname,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                    ],
                  ),
                        SizedBox(height: 15,),Row( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Postal Code :     '),
                            Text("       $postalcode",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 15,),Row( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Iso Country Code :      '),
                            Text("       $isoCountrycode",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 15,),Row( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sub Thorough Fare :     '),
                            Text("     $subThoroughFare",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 15,),Row( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sub Adminstration Area :     '),
                            Text("    $subadminstrationarea",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 15,),Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Country :   '),
                            Text("     $country",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.25,
                child: Card(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(

                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: lat.toString()
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              hintText: long.toString()
                          ),
                        ),
                        SizedBox(height: 15,),



                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () async{
                List<Placemark> address= await placemarkFromCoordinates(lat, long);
                // List<Placemark> address=await placemarkFromCoordinates(38.9071926, -77.0368722);
                print(name);
                setState((){
                  name=address.last.name.toString();
                  streetAddress=address.last.street.toString();
                  localityName=address.last.locality.toString();
                  throughfare=address.last.thoroughfare.toString();
                  administrativeAreaname=address.last.administrativeArea.toString();
                  postalcode=address.last.postalCode.toString();
                  isoCountrycode=address.last.isoCountryCode.toString();
                  sublocality=address.last.subLocality.toString();
                  subThoroughFare=address.last.subThoroughfare.toString();
                  country=address.last.country.toString();
                  subadminstrationarea=address.last.subAdministrativeArea.toString();

                });
              }, child: Text('Find Current Address'))
            ],
          ),
        ),
      ),
    );
  }
}
