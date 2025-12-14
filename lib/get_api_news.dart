import 'package:dio/dio.dart';
import 'package:flutter_nhom4/model/new.dart';


class API {
  Future<List<Article>> getAllNews() async {
    var url =
        "https://newsapi.org/v2/everything?q=tesla&from=2025-11-14&sortBy=publishedAt&apiKey=9f4aa149b900413f89c5a2fbad017afc";

    var dio = Dio();
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      List articlesJson = response.data['articles'];
      return articlesJson
          .map((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception("Lỗi kết nối API");
    }
  }
}

var test_api_new = API();