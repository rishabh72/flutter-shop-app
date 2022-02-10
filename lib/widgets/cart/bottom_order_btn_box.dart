import 'package:flutter/material.dart';

class BottomOrderBtnBox extends StatelessWidget {
  final int numOfCartItems;

  const BottomOrderBtnBox(this.numOfCartItems, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5,
          spreadRadius: 3,
        )
      ]),
      child: Column(
        children: [
          Text('$numOfCartItems Items selected for order'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.pink.shade400),
              ),
              onPressed: () {},
              child: Text(
                'place order'.toUpperCase(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
