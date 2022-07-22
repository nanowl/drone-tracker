import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/model/DroneData.dart';
import 'package:retrofit/retrofit.dart';
import '../model/News.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: 'http://localhost:3000/')
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/lognum')
  Future<List<int>> getTopNewsId();

  @GET('/drone-log/{lognum}')
  Future<DroneData> getNewsDetail(@Path() int lognum);
}
