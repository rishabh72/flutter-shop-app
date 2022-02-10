import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  final String img;

  const EmptyCart(this.img, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.network(
              img,
              height: 150,
            ),
          ),
          const Text(
            'Hey, it feels so light!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'There is nothing in your bag. Let\'s add some items.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
