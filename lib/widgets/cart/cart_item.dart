import 'package:flutter/material.dart';
import 'package:myntra_shop/widgets/cart/remove_cart_popup_content.dart';
import '../../providers/cart.dart';

class CartListItem extends StatelessWidget {
  final CartItem itm;

  const CartListItem(this.itm, {Key? key}) : super(key: key);

  void onRemoveItem(BuildContext ictx) {
    showModalBottomSheet(
        context: ictx,
        builder: (context) {
          return RemoveCartPopupContent(itm.prod);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(itm.prod.imgs[0]),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itm.prod.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(itm.prod.shortDescription.length > 25
                        ? itm.prod.shortDescription.substring(0, 22) + '...'
                        : itm.prod.shortDescription),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sold by: ${itm.prod.soldBy}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '₹${itm.prod.discountedPrice.toInt()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '₹${itm.prod.price.toInt()}',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: InkWell(
                  onTap: () => onRemoveItem(context),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
