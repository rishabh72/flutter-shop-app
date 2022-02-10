import 'package:flutter/material.dart';

class CircleCloseBtn extends StatelessWidget {
  final VoidCallback closeFn;

  const CircleCloseBtn(this.closeFn, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: Ink(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: InkWell(
          onTap: closeFn,
          child: const Icon(
            Icons.close,
            size: 15,
          ),
          splashColor: Colors.grey,
        ),
      ),
    );
  }
}
