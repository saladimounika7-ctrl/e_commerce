import '../models/product_model.dart';

class HomeRemoteDatasource {

  Future<List<ProductModel>> getProducts() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    return const [

      ProductModel(
        id: 1,
        title: "Nike Air Max",
        price: 4999,
        description: "Running Shoes",
        category: "Shoes",
        image: "https://picsum.photos/seed/nike-air-max/200/200",
      ),

      ProductModel(
        id: 2,
        title: "iPhone 16",
        price: 99999,
        description: "Apple Mobile",
        category: "Electronics",
        image: "https://picsum.photos/seed/iphone-16/200/200",
      ),

      ProductModel(
        id: 3,
        title: "Samsung TV",
        price: 35000,
        description: "Smart TV",
        category: "Electronics",
        image: "https://picsum.photos/seed/samsung-tv/200/200",
      ),
    ];
  }
}
