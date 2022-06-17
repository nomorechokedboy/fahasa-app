import 'package:fahasa_app/components/call_to_action.dart';
import 'package:fahasa_app/components/notification_card.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool hasNotification = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return hasNotification
        ? loading
            ? ListView(
                children: const [
                  SizedBox(height: 10),
                  _TimeStatusText('Today'),
                  NotificationCard(loading: true),
                  NotificationCard(loading: true),
                  NotificationCard(loading: true),
                  NotificationCard(loading: true),
                  _TimeStatusText('Ealier'),
                  NotificationCard(loading: true),
                  NotificationCard(loading: true),
                  NotificationCard(loading: true),
                ],
              )
            : ListView(
                children: const [
                  SizedBox(height: 10),
                  _TimeStatusText('Today'),
                  NotificationCard(),
                  NotificationCard(unread: false),
                  NotificationCard(unread: false),
                  _TimeStatusText('Ealier'),
                  NotificationCard(),
                  NotificationCard(unread: false),
                  NotificationCard(unread: false),
                  NotificationCard(),
                  NotificationCard(),
                  NotificationCard(),
                ],
              )
        : const CallToAction(
            message: 'There are nothing to tell you.',
          );
  }
}

// class Notifications extends StatelessWidget {
//   const Notifications({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const bool hasNotification = true;
//     const bool loading = false;

//     return hasNotification
//         ? loading
//             ? ListView(
//                 children: const [
//                   SizedBox(height: 10),
//                   _TimeStatusText('Today'),
//                   NotificationCard(loading: true),
//                   NotificationCard(loading: true),
//                   NotificationCard(loading: true),
//                   NotificationCard(loading: true),
//                   _TimeStatusText('Ealier'),
//                   NotificationCard(loading: true),
//                   NotificationCard(loading: true),
//                   NotificationCard(loading: true),
//                 ],
//               )
//             : ListView(
//                 children: const [
//                   SizedBox(height: 10),
//                   _TimeStatusText('Today'),
//                   NotificationCard(),
//                   NotificationCard(unread: false),
//                   NotificationCard(unread: false),
//                   _TimeStatusText('Ealier'),
//                   NotificationCard(),
//                   NotificationCard(unread: false),
//                   NotificationCard(unread: false),
//                   NotificationCard(),
//                   NotificationCard(),
//                   NotificationCard(),
//                 ],
//               )
//         : const CallToAction(
//             message: 'There are nothing to tell you.',
//           );
//   }
// }

class _TimeStatusText extends StatelessWidget {
  const _TimeStatusText(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
