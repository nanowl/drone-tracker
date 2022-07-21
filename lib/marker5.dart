import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  String title;
  GoogleMapPage({this.title});

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {

  Location location;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location = Location();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: location.getLocation(),
          builder: (BuildContext context, AsyncSnapshot<LocationData> _) {
            if(!_.hasData){ /// 현재 내 위치데이터값이 null경우 로딩
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_.data.latitude, _.data.longitude),
                zoom: 16,
              ),
              onTap: (_){

              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              circles: Set.from([Circle(
                circleId: CircleId("location"),
                center: LatLng(_.data.latitude, _.data.longitude),
                strokeWidth: 1,
                //strokeColor: Colors.blue[200],
                radius: 500,
              )]),
            );
          },)
    );
  }
}
