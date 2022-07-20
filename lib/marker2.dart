
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';



void main() => runApp(MaterialApp(home:HomeScreen()));


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition
    (target: LatLng(37.512609, 127.102767),
    zoom: 14,
  );

  List<Marker> marker = [];
  List<Marker> list =  const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.512609, 127.102767),
        infoWindow: InfoWindow(
            title: 'My postion'
        )
    )
  ];




  @override
  void initState() {
    // todo
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

