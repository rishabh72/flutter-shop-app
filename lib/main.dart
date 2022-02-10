import 'package:flutter/material.dart';
import 'package:myntra_shop/providers/cart.dart';
import 'package:myntra_shop/providers/favorites.dart';
import 'package:myntra_shop/providers/products.dart';
import 'package:myntra_shop/screens/cart_screen.dart';
import 'package:myntra_shop/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'screens/products_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Favorites(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'JosefinSans',
          primarySwatch: Colors.pink,
        ),
        home: const ProductsListScreen(),
        routes: {
          ProductsListScreen.routeName: (ctx) => const ProductsListScreen(),
          WishlistScreen.routeName: (ctx) => const WishlistScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}
