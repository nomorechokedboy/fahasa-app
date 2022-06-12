import 'package:flutter/material.dart';

import 'button.dart';

class CartItem extends StatelessWidget {
  final String message;
  final CTAButton? button;

  const CartItem({
    Key? key,
    required this.message,
    this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/cta_image.png'),
            width: 150,
            height: 150,
          ),
          const _CTAText('Oops!'),
          _CTAText(message),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: button,
          ),
        ],
      ),
    );
  }
}
