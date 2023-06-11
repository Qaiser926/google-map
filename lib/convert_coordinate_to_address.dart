// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertCoordinateToAddress extends StatefulWidget {
  @override
  State<ConvertCoordinateToAddress> createState() =>
      _ConvertCoordinateToAddressState();
}

class _ConvertCoordinateToAddressState
    extends State<ConvertCoordinateToAddress> {
  String myaddress = '';
  String mycoordinate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'the address is : ${myaddress}',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () async {
                  /// our is niche code see address find kar sakte
                  /// convert latlang to addresss
                  List<Placemark> address =
                      await placemarkFromCoordinates(33.0231753, 70.7048707);

                  setState(() {
                    myaddress = address.reversed.last.country.toString() +
                        " , " +
                        address.reversed.last.administrativeArea.toString() +
                        " , " +
                        address.reversed.last.street.toString() +
                        " , " +
                        address.reversed.last.locality.toString();
                  });
                },
                child: Text('Convert coordinate to Address')),
            const SizedBox(
              height: 20,
            ),
            Text(mycoordinate),
            ElevatedButton(
                onPressed: () async {
                  /// convert address to latlang
                  ///

                  List<Location> location = await locationFromAddress(
                      'University of Science & Technology Bannu');

                  print(mycoordinate =
                      location.reversed.last.latitude.toString() +
                          " , " +
                          location.reversed.last.longitude.toString());
                  setState(() {
                    mycoordinate = location.reversed.last.latitude.toString() +
                        " , " +
                        location.reversed.last.longitude.toString();
                  });
                },
                child: const Text('Convert Address to coordinate'))
          ],
        ),
      ),
    );
  }
}
