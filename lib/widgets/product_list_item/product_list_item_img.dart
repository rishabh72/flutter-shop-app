import 'package:flutter/material.dart';
import '../../providers/product.dart';
import './product_list_item_rating.dart';

class ProductListItemImg extends StatelessWidget {
  final Product prod;

  const ProductListItemImg(this.prod, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          prod.imgs[0],
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: ProductListItemRating(prod.rating, prod.ratingCount),
          bottom: 5,
        ),
      ],
    );
  }
}
