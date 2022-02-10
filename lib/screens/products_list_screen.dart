import 'package:flutter/material.dart';
import 'package:myntra_shop/widgets/nav/cart_badge.dart';
import 'package:provider/provider.dart';
import '../screens/wishlist_screen.dart';
import '../providers/products.dart';
import '../widgets/product_list_item/product_list_item.dart';

class ProductsListScreen extends StatelessWidget {
  static const routeName = 'list';
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodList = Provider.of<Products>(context, listen: false).items;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(WishlistScreen.routeName);
              },
              icon: const Icon(
                Icons.favorite_border_rounded,
                size: 26,
              ),
            ),
            const CartBadge(),
          ]),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
        ),
        itemBuilder: (ctx, index) {
          return ProductListItem(
            prodList[index],
          );
        },
        itemCount: prodList.length,
      ),
    );
  }
}
