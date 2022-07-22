import 'package:google_maps/google_maps.dart';
import 'package:google_maps_in_flutter/model/DroneData.dart';
import 'package:google_maps_in_flutter/retrofit/RestClient.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/News.dart';

class RetrofitScreen extends StatefulWidget {
  const RetrofitScreen({Key? key}) : super(key: key);

  @override
  _RetrofitScreenState createState() => _RetrofitScreenState();
}

class _RetrofitScreenState extends State<RetrofitScreen> {
  late RestClient client;

  @override
  void initState() {
    super.initState();


    Dio dio = Dio();
    client = RestClient(dio);
    Future.microtask(() async {
      final testGetId = await client.getTopNewsId();
      print(testGetId);
      for (int i=0; i<testGetId.length; i++) {
        var testGetDetail = await client.getNewsDetail(testGetId[0]);
        print(testGetDetail);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}