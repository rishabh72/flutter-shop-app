import 'package:flutter/material.dart';
import 'package:myntra_shop/screens/products_list_screen.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            const Text(
              'Your wishlist is empty',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Save items that you like in your wishlist. Review them anytime and easily move them to the bag.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ProductsListScreen.routeName,
                    (Route<dynamic> route) => false);
              },
              child: const Text('SHOP NOW'),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(220, 220, 220, 1)),
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.pink),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
