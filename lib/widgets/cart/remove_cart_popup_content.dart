import 'package:flutter/material.dart';
import 'package:myntra_shop/providers/cart.dart';
import 'package:myntra_shop/providers/favorites.dart';
import 'package:myntra_shop/providers/product.dart';
import 'package:provider/provider.dart';

class RemoveCartPopupContent extends StatelessWidget {
  final Product prod;

  const RemoveCartPopupContent(this.prod, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    child: Image.network(prod.imgs[0]),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Move from Bag',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Are you sure you want to move this item from bag?',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.close)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Provider.of<Cart>(context, listen: false)
                          .removeFromCart(prod.id);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'remove'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(90, 90, 90, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Provider.of<Cart>(context, listen: false)
                          .removeFromCart(prod.id);
                      Provider.of<Favorites>(context, listen: false)
                          .addToFav(prod);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'move to wishlist'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
