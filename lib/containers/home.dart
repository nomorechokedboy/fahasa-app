import 'package:flutter/material.dart';

import '../api/product.dart';
import '../components/product.dart';
import '../models/product.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> productList = getAllProduct();

    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: (1 / 1.4),
        padding: const EdgeInsets.all(10),
        children: [...products(productList)]);
  }

  List<Widget> products(List<ProductModel> productList) => productList
      .map((product) => Product(
            authorName: product.authorName,
            id: product.id,
            name: product.name,
            price: product.price,
            src: product.image,
          ))
      .toList();
}
