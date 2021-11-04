import 'package:e_commerce_shop_app/models/product.dart';
import 'package:flutter/material.dart';

class SearchModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Product> _suggestions = history;
  List<Product> get suggestions => _suggestions;

  String _query = '';
  String get query => _query;

  void onQueryChanged(String query) async {
    if (query == _query) return;

    _query = query;
    _isLoading = true;
    notifyListeners();

    if (query.isEmpty) {
      _suggestions = history;
    } else {
      // final response = await http.get('https://photon.komoot.io/api/?q=$query');
      // final body = json.decode(utf8.decode(response.bodyBytes));
      // final features = body['features'] as List;

      // _suggestions = features.map((e) => Place.fromJson(e)).toSet().toList();
    }

    _isLoading = false;
    notifyListeners();
  }

  void clear() {
    _suggestions = history;
    notifyListeners();
  }
}

const List<Product> history = [];
