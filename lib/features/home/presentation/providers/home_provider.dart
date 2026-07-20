import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/home_remote_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../controllers/home_controller.dart';
import '../../domain/entities/product.dart';

final homeDatasourceProvider =
    Provider<HomeRemoteDatasource>((ref) {
  return HomeRemoteDatasource();
});

final homeRepositoryProvider =
    Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    ref.watch(homeDatasourceProvider),
  );
});

final getProductsUseCaseProvider =
    Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(
    ref.watch(homeRepositoryProvider),
  );
});

final homeControllerProvider =
    AsyncNotifierProvider<HomeController, List<Product>>(
  HomeController.new,
);