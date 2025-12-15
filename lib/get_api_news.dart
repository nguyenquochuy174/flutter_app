import 'package:dio/dio.dart';
import 'package:flutter_nhom4/model/new.dart';

class API {
  final String apiKey = "pub_47e206aab2274b9cbd898da3813e692c";

  Future<List<Article>> getAllNews() async {
    var url =
        "https://newsdata.io/api/1/latest?apikey=$apiKey&country=vn&language=vi";

    var dio = Dio(
      BaseOptions(
        headers: {
          "User-Agent": "FlutterApp",
        },
      ),
    );

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      List articlesJson = response.data['results']; 
      return articlesJson
          .map((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception("Lỗi kết nối API: ${response.statusCode}");
    }
  }
}

var test_api_new = API();
