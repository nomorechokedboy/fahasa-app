import 'package:flutter/material.dart';

AppBar secondaryAppBar([String? title]) => AppBar(
      actions: [
        Container(
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 25,
              semanticLabel: 'To shopping cart',
            ),
            margin: const EdgeInsets.only(right: 20))
      ],
      title: title != null ? Text(title) : null,
    );

AppBar primaryAppBar() => AppBar(
      actions: [
        Container(
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 25,
              semanticLabel: 'To shopping cart',
            ),
            margin: const EdgeInsets.only(right: 20))
      ],
      leading: const Icon(
        Icons.search,
        size: 25,
        semanticLabel: 'Search action',
      ),
    );
