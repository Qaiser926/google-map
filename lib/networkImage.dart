import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:ui';

class NetworkImagePage extends StatefulWidget {
  const NetworkImagePage({super.key});

  @override
  State<NetworkImagePage> createState() => _NetworkImagePageState();
}

class _NetworkImagePageState extends State<NetworkImagePage> {
  CameraPosition cameraPosition =
      CameraPosition(target: LatLng(33.660197, 73.027928), zoom: 13);
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> _marker = [];

  List<LatLng> latlng = [
    LatLng(33.660197, 73.027928),
    LatLng(33.666844, 73.047636),
    LatLng(33.659966, 73.046643),
    LatLng(33.672003, 73.037425),
    LatLng(33.671871, 73.049981),
    LatLng(33.662413, 73.058126),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    for (var i = 0; i < latlng.length; i++) {
      Uint8List? iimage = await loadNetworkImage(
          "https://media.istockphoto.com/id/1407359693/photo/3d-render-illustration-of-car-on-white-background-3d-render-red-car-icon-on-white-background.jpg?s=1024x1024&w=is&k=20&c=f2IbSLTsRpsFdg2Nh-nRAh3VrXi0Vu4FwFvGiGtSebY=");
     
     // ab is k bad image ka size kam kare ge warna error de ga.
      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
        iimage.buffer.asUint8List(),
        targetHeight: 150,
        targetWidth: 150,
      );
      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData =
          await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List resizeImageMarker = byteData!.buffer.asUint8List();
      _marker.add(Marker(
        
          markerId: MarkerId(i.toString()),
          position: latlng[i],
          infoWindow: InfoWindow(
              title: "Islamabad Location",
              snippet: "Title of marker ${i.toString()}"),
          icon: BitmapDescriptor.fromBytes(resizeImageMarker)));
      setState(() {});
    }
  }
// yaha par network image load kar rahe he
  Future<Uint8List> loadNetworkImage(String path) async {
    final complete = Completer<ImageInfo>();
    var image = NetworkImage(path,
    );
    image
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((info, _) => complete.complete(info)));
    final imageInfo = await complete.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set.of(_marker),
        myLocationEnabled: true,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
