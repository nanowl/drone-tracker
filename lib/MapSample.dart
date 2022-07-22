import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  // Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4537251, 126.7960716),
    zoom: 14.4746,
  );

  List<Marker> _markers = [];
  void initState(){
    super.initState();
    _markers.add(Marker(
      markerId: MarkerId("1"),
      draggable: true,
      onTap: () => print("Marker!"),
      position: LatLng(37.4537251, 126.7960716),
    ));
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markers),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (_) {},
        myLocationButtonEnabled: false,
      ),

    );
  }
}
