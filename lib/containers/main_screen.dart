import 'package:fahasa_app/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';
import 'user.dart';
import 'notifications.dart';
import 'orders.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final _appBars = const <PreferredSizeWidget>[
    _PrimaryAppBar(),
    _SecondaryAppBar(title: 'Notifications'),
    _SecondaryAppBar(title: 'Orders'),
    _SecondaryAppBar(title: 'User')
  ];

  final PageController _pageController = PageController();
  int _select = 0;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_select],
      body: PageView(
        children: const [
          Home(),
          Notifications(),
          Orders(),
          User(),
        ],
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _select = page;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  _pageController.jumpToPage(0);
                  setState(() {
                    _select = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: _select == 0
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  _pageController.jumpToPage(1);
                  setState(() {
                    _select = 1;
                  });
                },
                icon: Icon(
                  Icons.notifications_rounded,
                  color: _select == 1
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                )),
            const SizedBox(width: 50),
            IconButton(
                onPressed: () {
                  _pageController.jumpToPage(2);
                  setState(() {
                    _select = 2;
                  });
                },
                icon: Icon(
                  Icons.subject_rounded,
                  color: _select == 2
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  _pageController.jumpToPage(3);
                  setState(() {
                    _select = 3;
                  });
                },
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: _select == 3
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

class _SecondaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const _SecondaryAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, toCartScreen);
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                  semanticLabel: 'To shopping cart',
                )),
            margin: const EdgeInsets.only(right: 20))
      ],
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const _PrimaryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, toCartScreen);
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                semanticLabel: 'To shopping cart',
              ),
            ),
            margin: const EdgeInsets.only(right: 20))
      ],
      leading: const Icon(
        Icons.search,
        size: 25,
        semanticLabel: 'Search action',
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
