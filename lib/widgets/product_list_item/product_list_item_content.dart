import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product.dart';
import '../../providers/favorites.dart';

class ProductListItemContent extends StatelessWidget {
  final Product prodItem;

  const ProductListItemContent(this.prodItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<Favorites>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                prodItem.name,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                ),
              ),
              Consumer<Favorites>(
                builder: (c, favs, _) => IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    if (favs.favItems.containsKey(prodItem.id)) {
                      prodProvider.removeFromFav(prodItem.id);
                    } else {
                      prodProvider.addToFav(prodItem);
                    }
                  },
                  icon: Icon(
                    favs.favItems.containsKey(prodItem.id)
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: favs.favItems.containsKey(prodItem.id)
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: Text(
              prodItem.shortDescription.length > 25
                  ? prodItem.shortDescription.substring(0, 22) + '...'
                  : prodItem.shortDescription,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            margin: EdgeInsets.only(bottom: 5),
          ),
          Row(
            children: [
              Text(
                '₹${prodItem.price}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '₹${prodItem.discountedPrice}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
