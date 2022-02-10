import 'package:flutter/material.dart';

class ProductListItemRating extends StatelessWidget {
  final double rating;
  final int ratingCount;

  const ProductListItemRating(this.rating, this.ratingCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      child: Card(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Row(
          children: [
            const Spacer(),
            Text(
              rating.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
            ),
            const Icon(
              Icons.star,
              color: Colors.green,
              size: 8,
            ),
            const Spacer(),
            const Text(
              '|',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Spacer(),
            Text(
              ratingCount.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(90, 90, 90, 1),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
