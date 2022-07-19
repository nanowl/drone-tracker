import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class serverConnector extends StatelessWidget {
  const serverConnector({Key? key}) : super(key: key);

  void _callAPI() async {
    var url = Uri.parse(
      'https://raw.githubusercontent.com/dev-yakuza/users/master/api.json',
    );
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _callAPI,
          child: const Text('Call API'),
        ),
      ),
    );
  }
}
