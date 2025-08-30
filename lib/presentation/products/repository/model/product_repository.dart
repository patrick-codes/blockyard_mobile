import 'package:dio/dio.dart';
import '../../../../utils/constants/api constants/api_constants.dart';
import 'products_model.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get(getProductsUrl);

    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<Product> fetchProductById(String id) async {
    final response = await _dio.get("$getSingleProductUrl/$id");

    if (response.data is Map<String, dynamic>) {
      // API returned a single product object
      return Product.fromJson(response.data);
    } else if (response.data is List && response.data.isNotEmpty) {
      // In case API returns a list, just grab the first item
      return Product.fromJson(response.data[0]);
    } else {
      throw Exception("Unexpected response format: ${response.data}");
    }
  }
}
