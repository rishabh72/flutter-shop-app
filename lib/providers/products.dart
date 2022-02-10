import 'package:flutter/material.dart';
import '../dummy_products_list_data.dart';
import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = DUMMY_PROD_LIST;

  List<Product> get items {
    return _items;
  }
}
