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
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    client = RestClient(dio);
  }

  newsCard({
    required News news,
  }) {
    return Card(
      child: Column(
        children: [
          Text(news.id.toString()),
          Text(news.title),
          Text(news.type),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrofit'),
      ),
      body: FutureBuilder(
        future: client.getTopNewsId(),
        initialData: [],
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final ids = snapshot.data;

          return ListView.builder(
            itemCount: ids.length,
            itemBuilder: (_, index) {
              return FutureBuilder(
                future: client.getNewsDetail(ids[index]),
                builder: (_, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return newsCard(news: snapshot.data);
                },
              );
            },
          );
        },
      ),
    );
  }
}