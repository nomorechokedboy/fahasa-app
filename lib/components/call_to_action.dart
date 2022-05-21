import 'package:flutter/material.dart';

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
          callToActionText('Oops!'),
          callToActionText(message),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: withButton
                ? OutlinedButton(
                    onPressed: () {},
                    child: callToActionText(buttonLabel!),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.red,
                      side: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Text callToActionText(String data) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
