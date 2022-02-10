import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart.dart';
import '../../providers/favorites.dart';
import '../../providers/product.dart';
import '../ui/circle_close_btn.dart';

class WishlistItem extends StatelessWidget {
  final Product prod;
  const WishlistItem(this.prod, {Key? key}) : super(key: key);

  void closeHandler(BuildContext ctx) {
    Provider.of<Favorites>(ctx, listen: false).removeFromFav(prod.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(prod.imgs[0]),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: CircleCloseBtn(() => closeHandler(context)),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 10, right: 10, left: 10, bottom: 5),
                  child: Text(
                    prod.name,
                    style: const TextStyle(
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '₹${prod.discountedPrice}',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '₹${prod.price}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<Cart>(context, listen: false).addToCart(prod);
              Provider.of<Favorites>(context, listen: false)
                  .removeFromFav(prod.id);
              ScaffoldMessenger.of(context).removeCurrentSnackBar();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green.shade600,
                  content: const Text('Successfully moved item to Bag'),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              )),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'move to bag'.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
