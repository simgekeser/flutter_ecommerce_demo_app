import 'dart:math';

import 'package:e_commerce_shop_app/models/product.dart';
import 'package:e_commerce_shop_app/utilities/service.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> productsList = [];
  List<Product> allProductsList = [];
  List<Product> basketProductsList = [];
  bool isCategorySelected = false;

  Future<List<Product>> fetchProducts() async {
    await Service.loadLocalProducts().then((value) => {
          if (value == null)
            {
              print('products no loaded'),
            }
          else
            {productsList = value, allProductsList = value}
        });
    return allProductsList;
  }

  getAllProducts() {
    productsList = allProductsList;
    productsList.shuffle(Random.secure());
    notifyListeners();
    return allProductsList;
  }

  getCategoryProducts(var categoryName) {
    productsList = allProductsList
        .where((element) => element.category.contains(categoryName))
        .toList();
    notifyListeners();
    return productsList;
  }

  sortList(String sortValue) {
    switch (sortValue) {
      case "Ascending":
        productsList.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Decreasing":
        productsList.sort((b, a) => a.price.compareTo(b.price));
        break;
      case "Top Rated":
        productsList.sort((b, a) => a.rating.rate.compareTo(b.rating.rate));
        break;
      default:
        productsList.shuffle(Random.secure());
    }
    notifyListeners();
  }

  void setBasketProductsList(Product product) {
    basketProductsList.add(product);
    notifyListeners();
  }
}
