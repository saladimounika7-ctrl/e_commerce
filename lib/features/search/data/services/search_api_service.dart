import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class SearchApiService {
  static const String baseUrl = "https://dummyjson.com/products/search";

  Future<List<ProductModel>> searchProducts(String query) async {
    final url = Uri.parse("$baseUrl?q=$query");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List products = data["products"];

      return products
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}