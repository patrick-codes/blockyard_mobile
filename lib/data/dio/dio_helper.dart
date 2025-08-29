import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/api constants/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            debugPrint('Unauthorized error, token might be expired.');
            debugPrint(e.response!.statusMessage);
          }
          return handler.next(e);
        },
      ),
    );
  }

// DioHelper
  static Future<void> addAuthHeader() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // 👈 changed
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
      debugPrint('Authorization Header Set: Bearer $token');
    } else {
      debugPrint('No token found, skipping Authorization header');
    }
  }

  static Future<Response> getAllData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    await addAuthHeader();
    debugPrint('Requesting $url with headers: ${dio.options.headers}');

    debugPrint('Request headers: ${dio.options.headers}');

    return await dio.get(url, queryParameters: queryParameters);
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
    bool requiresAuth = true,
  }) async {
    if (requiresAuth) {
      await addAuthHeader();
    } else {
      dio.options.headers.remove('Authorization');
    }

    debugPrint('Posting to $url with data: $data');
    return await dio.post(url, data: data);
  }

  static Future<Response> getSingleData({
    required String url,
    required String id,
  }) async {
    return await dio.get('$url/$id');
  }

  static Future<Response> deleteData({
    required String url,
    required String id,
  }) async {
    return await dio.delete('$url/$id');
  }
}
