import 'package:flutter/material.dart';
import './product.dart';

class Favorites with ChangeNotifier {
  final Map<String, Product> _favItems = {};

  Map<String, Product> get favItems {
    return _favItems;
  }

  void addToFav(Product prod) {
    if (!_favItems.containsKey(prod.id)) {
      _favItems[prod.id] = prod;
      notifyListeners();
    }
  }

  void removeFromFav(String id) {
    if (_favItems.containsKey(id)) {
      _favItems.remove(id);
      notifyListeners();
    }
  }
}
