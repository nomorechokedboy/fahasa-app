import 'package:fahasa_app/components/call_to_action.dart';
import 'package:fahasa_app/components/notification_card.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bool hasNotification = true;

    return hasNotification
        ? ListView(
            children: [
              const SizedBox(height: 10),
              timeStatusText('Today'),
              const NotificationCard(),
              const NotificationCard(unread: false),
              const NotificationCard(unread: false),
              timeStatusText('Ealier'),
              const NotificationCard(),
              const NotificationCard(unread: false),
              const NotificationCard(unread: false),
              const NotificationCard(),
              const NotificationCard(),
              const NotificationCard(),
            ],
          )
        : const CallToAction(
            message: 'There are nothing to tell you.',
            buttonLabel: 'Go shopping now');
  }

  Padding timeStatusText(String data) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
