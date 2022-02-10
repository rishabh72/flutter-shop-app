import 'package:flutter/material.dart';
import 'package:myntra_shop/screens/wishlist_screen.dart';
import 'package:myntra_shop/widgets/cart/bottom_order_btn_box.dart';
import 'package:myntra_shop/widgets/cart/empty_cart.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context).cartItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WishlistScreen.routeName);
            },
            icon: Icon(Icons.favorite_border_rounded),
          )
        ],
      ),
      body: cartItems.length > 0
          ? Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        final itemKey = cartItems.keys.elementAt(index);
                        final item = cartItems[itemKey] as CartItem;
                        return CartListItem(item);
                      },
                      itemCount: cartItems.length,
                    ),
                  ),
                ),
                // BottomOrderBtnBox(cartItems.length),
              ],
            )
          : EmptyCart(
              'https://constant.myntassets.com/checkout/assets/img/empty-bag.webp'),
    );
  }
}
