import '../entities/product.dart';
import '../repositories/home_repository.dart';

class GetProductsUseCase {

  final HomeRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() {

    return repository.getProducts();

  }

}