import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../utils/constants/api constants/api_constants.dart';
import '../order model/order_model.dart';

class OrderRepository {
  final Dio _dio = Dio();

  Future<OrderResponse> createOrder(OrderRequest request) async {
    try {
      final response = await _dio.post(
        createOrderUrl,
        data: request.toJson(),
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return OrderResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to create order: ${response.data}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.response?.data ?? e.message}");
    }
  }

  Future<List<OrderResponse>> fetchOrders() async {
    try {
      final response = await _dio.get(getOrdersUrl);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as List;

        final orders =
            data.map((json) => OrderResponse.fromJson(json)).toList();

        return orders; // ✅ return all orders
      } else {
        throw Exception("Failed to fetch orders: ${response.data}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.response?.data ?? e.message}");
    }
  }
}
