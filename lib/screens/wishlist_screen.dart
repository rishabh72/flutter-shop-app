import 'package:flutter/material.dart';
import 'package:myntra_shop/widgets/nav/cart_badge.dart';
import 'package:provider/provider.dart';
import '../providers/favorites.dart';
import '../widgets/wishlist/empty_wishlist.dart';
import '../widgets/wishlist/wishlist.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = 'wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favs = Provider.of<Favorites>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          CartBadge(),
        ],
      ),
      body: favs.favItems.isEmpty ? EmptyWishlist() : Wishlist(),
    );
  }
}
