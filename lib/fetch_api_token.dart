import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        "https://dummyjson.com/auth/login",
        data: {
          "username": username,
          "password": password,
          "expiresInMins": 30,
        },
      );
      return response.data; 
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getProfile(String token) async {
    try {
      final response = await _dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return response.data;
    } catch (e) {
      print("Profile error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        "https://dummyjson.com/auth/refresh",
        options: Options(
          headers: {
            "Authorization": "Bearer $refreshToken",
          },
        ),
      );

      return response.data; 
    } catch (e) {
      print("Refresh Token error: $e");
      return null;
    }
  }
}
