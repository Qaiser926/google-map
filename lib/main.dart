

import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_map_tester_app/homePage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body:HomePage()
    )
    );
  }
}
