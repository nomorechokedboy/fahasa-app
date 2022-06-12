import 'package:flutter/material.dart';

import 'button.dart';

class CallToAction extends StatelessWidget {
  final String message;
  final String? buttonLabel;

  const CallToAction({Key? key, required this.message, this.buttonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool withButton = buttonLabel != null && buttonLabel!.isNotEmpty;

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
            child: withButton
                ? FaButton(
                    onPressed: () {},
                    secondary: true,
                    label: buttonLabel!,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

class _CTAText extends StatelessWidget {
  final String message;

  const _CTAText(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
