import 'package:flutter/material.dart';

import 'button.dart';

class CallToAction extends StatelessWidget {
  final String message;
  final CTAButton? button;

  const CallToAction({
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

class CTAButton extends FaButton {
  /// CTAButton is FaButton but with secondary background color.
  CTAButton({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
  }) : super(
          key: key,
          label: label,
          secondary: true,
          onPressed: onPressed,
        );
}

class _CTAText extends StatelessWidget {
  final String message;

  const _CTAText(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
