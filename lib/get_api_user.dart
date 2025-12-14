import 'package:dio/dio.dart';
import 'package:flutter_nhom4/model/user.dart';

class API {
  Future<List<User>> getAllUser() async {
    var url = "https://fakestoreapi.com/users";
    var dio = Dio();
    var response = await dio.request(url);
    List<User> ls = [];
    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map((json) => User.fromJson(json)).toList();
    } else {
      print("Lỗi kết nối API");
    }
    return ls;
  }
}

var test_api_user = API();