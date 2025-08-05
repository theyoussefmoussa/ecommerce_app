import 'package:dio/dio.dart';
import 'package:ecommerce_app/products/models/product_model.dart';

class ProductRepository {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get('$_baseUrl?limit=50');

      final productsJson = response.data['products'] as List;
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/search',
        queryParameters: {'q': query},
      );

      final productsJson = response.data['products'] as List;
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Search failed: ${e.message}');
    }
  }
}
