import 'package:flutter/material.dart';
import 'MapSample().dart';
import 'serverConnectTest.dart';
// import 'dart:convert';

void main() async {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
      // home: serverConnector(),
    );
  }
}

