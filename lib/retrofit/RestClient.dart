import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import '../model/News.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/topstories.json')
  Future<List<int>> getTopNewsId();

  @GET('/item/{id}.json')
  Future<News> getNewsDetail(@Path() int id);
}
