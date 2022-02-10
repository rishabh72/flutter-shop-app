import 'package:flutter/material.dart';
import '../../providers/product.dart';
import './product_list_item_content.dart';
import './product_list_item_img.dart';

class ProductListItem extends StatelessWidget {
  final Product prod;

  const ProductListItem(
    this.prod, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: .5,
          color: Colors.grey.shade400,
        ),
      ),
      child: Column(
        children: [
          ProductListItemImg(prod),
          ProductListItemContent(prod),
        ],
      ),
    );
  }
}
