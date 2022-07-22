import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class _GoogleMapBodyState extends State<GoogleMapBody> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4537251, 126.7960716),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onCameraMove: (_) {},
        myLocationButtonEnabled: false,
      ),
    );
  }
}

List<Marker> _markers = [];

@override
void initState() {
  super.initState();
  _markers.add(Marker(
      markerId: MarkerId("1"),
      draggable: true,
      onTap: () => print("Marker!"),
      position: LatLng(37.4537251, 126.7960716)));
}

@override
Widget build(BuildContext context) {
  return Container(
    child: GoogleMap(
      mapType: MapType.normal,
      markers: Set.from(_markers),
      initialCameraPosition: _kGooglePlex,
      onCameraMove: (_) {},
      myLocationButtonEnabled: false,
    ),
  );
}