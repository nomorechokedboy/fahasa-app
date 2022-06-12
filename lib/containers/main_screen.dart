import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/app_bart.dart';
import 'home.dart';
import 'user.dart';
import 'notifications.dart';
import 'orders.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final appBars = [
  primaryAppBar(),
  secondaryAppBar('Notifications'),
  secondaryAppBar('Orders'),
  secondaryAppBar('User')
];

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int select = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars[select],
      body: PageView(
        children: const <Widget>[
          Home(),
          Notifications(),
          Orders(),
          User(),
        ],
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            select = page;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  pageController.jumpToPage(0);
                  setState(() {
                    select = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: select == 0
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  pageController.jumpToPage(1);
                  setState(() {
                    select = 1;
                  });
                },
                icon: Icon(
                  Icons.notifications_rounded,
                  color: select == 1
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                )),
            const SizedBox(
              width: 50,
            ),
            IconButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                  setState(() {
                    select = 2;
                  });
                },
                icon: Icon(
                  Icons.subject_rounded,
                  color: select == 2
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  pageController.jumpToPage(3);
                  setState(() {
                    select = 3;
                  });
                },
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: select == 3
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                )),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const FaIcon(FontAwesomeIcons.truckFast),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
