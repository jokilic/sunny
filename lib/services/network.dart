import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class Network {
  final String url;
  final Dio dio;

  Network(this.url) : dio = Dio();

  Future getData() async {
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept-Charset': 'utf-8',
          'User-Agent': Platform.isIOS
              ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1'
              : 'Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.5481.153 Mobile Safari/537.36',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('Sunny: Network Error - ${response.statusCode}');
    }
  }
}
