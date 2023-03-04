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
          'User-Agent': 'josipkilic.com neksuses@gmail.com',
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
