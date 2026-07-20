import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product.dart';
import '../providers/home_provider.dart';

class HomeController extends AsyncNotifier<List<Product>> {

  @override
  Future<List<Product>> build() async {

    return [];

  }

  Future<void> loadProducts() async {

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {

      final products = await ref
          .read(getProductsUseCaseProvider)
          .call();

      return products;

    });

  }

}