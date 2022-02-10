import 'package:flutter/material.dart';
import 'package:myntra_shop/providers/cart.dart';
import 'package:myntra_shop/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numOfCartItems = Provider.of<Cart>(context).cartItems.length;
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 26,
          ),
        ),
        Positioned(
          right: 5,
          top: 2,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              numOfCartItems.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink,
            ),
          ),
        )
      ],
    );
  }
}
