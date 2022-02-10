import 'package:flutter/material.dart';
import './product.dart';

class CartItem {
  final Product prod;
  final int qty;
  final double priceSum;
  final double maxPriceSum;

  CartItem(
      {required this.prod,
      required this.qty,
      required this.priceSum,
      required this.maxPriceSum});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _carts = {};

  Map<String, CartItem> get cartItems {
    return _carts;
  }

  void addToCart(Product prod, [int inputQty = 1]) {
    if (_carts.containsKey(prod.id)) {
      _carts.update(
          prod.id,
          (prevVal) => CartItem(
              prod: prod,
              qty: inputQty,
              priceSum: inputQty.toDouble() * prod.discountedPrice,
              maxPriceSum: inputQty.toDouble() * prod.price));
    } else {
      _carts[prod.id] = CartItem(
          prod: prod,
          qty: 1,
          priceSum: prod.discountedPrice,
          maxPriceSum: prod.price);
    }

    notifyListeners();
  }

  void removeFromCart(String id) {
    if (_carts.containsKey(id)) {
      _carts.remove(id);
      notifyListeners();
    }
  }
}
