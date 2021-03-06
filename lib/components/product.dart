import 'package:flutter/material.dart';

import 'product_image.dart';

class Product extends StatelessWidget {
  final String src;
  final String id;
  final String name;
  final String authorName;
  final double price;

  const Product({
    Key? key,
    required this.src,
    required this.name,
    required this.authorName,
    required this.price,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 0),
            ),
          ]),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Expanded(
            child: ProductImage(
              src: src,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      '${price}d',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(5),
                  ),
                  const Text('\$15.00',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ))
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
