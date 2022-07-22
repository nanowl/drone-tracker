import 'package:flutter/material.dart';
import 'dart:async';
import 'MapSample.dart';
import 'RestScreen.dart';
void main() async {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      // home: RetrofitScreen(),
      home: MapSample(),
      // home: RetrofitScreen(),
    );
  }
}

