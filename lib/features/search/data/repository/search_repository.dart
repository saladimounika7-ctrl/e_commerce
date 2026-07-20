import '../models/product_model.dart';
import '../services/search_api_service.dart';

class SearchRepository {
  final SearchApiService _apiService = SearchApiService();

  Future<List<ProductModel>> searchProducts(String query) async {
    return await _apiService.searchProducts(query);
  }
}