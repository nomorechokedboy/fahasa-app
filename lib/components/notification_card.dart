import 'package:flutter/material.dart';
import './skeleton.dart';

class NotificationCard extends StatelessWidget {
  final bool unread;
  const NotificationCard({Key? key, this.unread = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const loading = true;

    return Container(
      color: loading
          ? Colors.transparent
          : unread
              ? Colors.blue.withAlpha(50)
              : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Skeleton(
          visible: loading,
          child: Row(
            children: [
              Container(
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
              ),
              Expanded(
                child: _buildText(context, loading: loading),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, {bool loading = false}) {
    if (loading) {
      final decoration = BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      );

      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 15,
              decoration: decoration,
            ),
            const SizedBox(height: 16),
            Container(
              width: 150,
              height: 10,
              decoration: decoration,
            ),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
      );
    }
  }
}
