import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map

  LatLng startLocation = LatLng(37.512609, 127.102767);
  LatLng endLocation = LatLng(37.512609, 127.102767);
  LatLng carLocation = LatLng(37.512609, 127.102767);

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/bike.png",
    );

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(startLocation.toString()),
          position: startLocation, //position of marker
          infoWindow: InfoWindow( //popup info
            title: 'Starting Point ',
            snippet: 'Start Marker',
          ),
          icon: markerbitmap, //Icon for Marker
        )
    );

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(endLocation.toString()),
          position: endLocation, //position of marker
          rotation:-45,
          infoWindow: InfoWindow( //popup info
            title: 'End Point ',
            snippet: 'End Marker',
          ),
          icon: markerbitmap, //Icon for Marker
        )
    );

    String imgurl = "https://www.fluttercampus.com/img/car.png";
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl))
        .load(imgurl))
        .buffer
        .asUint8List();

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(carLocation.toString()),
          position: carLocation, //position of marker
          infoWindow: InfoWindow( //popup info
            title: 'Car Point ',
            snippet: 'Car Marker',
          ),
          icon: BitmapDescriptor.fromBytes(bytes), //Icon for Marker
        )
    );

    setState(() {
      //refresh UI
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Image Marker on Google Map"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: GoogleMap( //Map widget from google_maps_flutter package
          zoomGesturesEnabled: true, //enable Zoom in, out on map
          initialCameraPosition: CameraPosition( //innital position in map
            target: startLocation, //initial position
            zoom: 14.0, //initial zoom level
          ),
          markers: markers, //markers to show on map
          mapType: MapType.normal, //map type
          onMapCreated: (controller) { //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
        )
    );
  }
}