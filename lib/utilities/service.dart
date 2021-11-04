import 'dart:convert';

import 'package:e_commerce_shop_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Service {
  static Future<List<Product>> loadLocalProducts() async {
    try {
      String response =
          await rootBundle.loadString('assets/shopping_json_data.json');
      List<dynamic> result = json.decode(response);
      return result.map((n) => Product.fromJson(n)).toList();
    } catch (e) {
      throw Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text('Convert Error'),
        ),
      );
    }
  }
}
