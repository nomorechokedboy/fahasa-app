import 'package:fahasa_app/constants/globals.dart';
import 'package:fahasa_app/containers/cart_screen.dart';
import 'package:fahasa_app/containers/order_detail.dart';
import 'package:fahasa_app/containers/product_detail.dart';
import 'package:flutter/material.dart';

import '../containers/main_screen.dart';
import '../containers/settings.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xffd22121)),
        secondaryHeaderColor: createMaterialColor(const Color(0xff0074FF)),
        focusColor: createMaterialColor(const Color(0xff8841E9)),
        highlightColor:
            createMaterialColor(const Color.fromRGBO(0, 116, 255, 0.1)),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
          headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          headline5: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          subtitle1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          subtitle2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
          button: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          caption: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MainScreen(),
      onGenerateRoute: routes(),
    );
  }

  RouteFactory routes() => (settings) {
        /* Map<String, dynamic> args = {}; */
        /* args = settings.arguments as Map<String, dynamic>; */

        Widget screen;
        switch (settings.name) {
          case toMainScreen:
            screen = const MainScreen();
            break;
          case toCartScreen:
            screen = const CartScreen();
            break;
          case toProductDetail:
            screen = const ProductDetail();
            break;
          case toOrderDetail:
            screen = const OrderDetail();
            break;
          case toUserSetting:
            screen = const Settings();
            break;
          default:
            return null;
        }

        return MaterialPageRoute(builder: (BuildContext context) => screen);
      };
}
