import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final bool unread;
  const NotificationCard({Key? key, this.unread = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notiImage = Container(
      width: 48,
      height: 48,
      child: const Icon(
        Icons.shopping_bag_rounded,
        color: Colors.white,
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );

    return Container(
      color: unread ? Colors.blue.withAlpha(50) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            notiImage,
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RichText(
                  text: TextSpan(
                    text: 'Order ',
                    style: DefaultTextStyle.of(context).style,
                    children: const [
                      TextSpan(
                        // TODO: replace with order name
                        text: '#1234',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' is waiting to be process'),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('9:20 AM'),
                SizedBox(height: unread ? 8 : 16),
                Container(
                  child: unread
                      ? const Icon(
                          Icons.circle,
                          color: Color(0xff0074ff),
                          size: 10,
                        )
                      : null,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
