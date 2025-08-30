import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../presentation/authentication/repository/data model/user_model.dart';
import '../../utils/constants/api constants/api_constants.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<UserModel> register(
      String name, String phone, String email, String password) async {
    try {
      final response = await _dio.post(
        signupUrl,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', response.data['token']);

        debugPrint('AuthToken saved locally.');
        debugPrint('AuthToken saved: ${response.data['token']}');

        return UserModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Registration failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ??
          'Network/Server error during register');
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        loginUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', response.data['token']);

        debugPrint('AuthToken saved locally.');
        debugPrint('AuthToken saved: ${response.data['token']}');
        return UserModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      throw Exception(
          e.response?.data['message'] ?? 'Network/Server error during login');
    }
  }
}
