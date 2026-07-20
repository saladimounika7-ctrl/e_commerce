import '../../domain/entities/product.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDatasource datasource;

  HomeRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts() async {

    return await datasource.getProducts();

  }
}