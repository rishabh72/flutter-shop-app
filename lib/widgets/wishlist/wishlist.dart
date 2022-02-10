import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favorites.dart';
import '../../providers/product.dart';
import './wishlist_item.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favs = Provider.of<Favorites>(context).favItems;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 330,
        ),
        itemBuilder: (c, index) {
          final itemKey = favs.keys.elementAt(index);
          return WishlistItem(favs[itemKey] as Product);
        },
        itemCount: favs.length,
      ),
    );
  }
}
