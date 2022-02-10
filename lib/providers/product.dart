import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String name;
  final double price;
  final double discountedPrice;
  final String shortDescription;
  final double rating;
  final int ratingCount;
  final List<String> imgs;
  final String id;
  final String soldBy;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discountedPrice,
    required this.shortDescription,
    required this.rating,
    required this.ratingCount,
    required this.imgs,
    required this.soldBy,
  });
}
