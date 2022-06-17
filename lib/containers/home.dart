import 'package:flutter/material.dart';

import '../api/product.dart';
import '../components/product.dart';
import '../models/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  late List<HomeProduct> productRes;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future fetchProduct() async {
    setState(() {
      isLoading = true;
    });

    List<dynamic> data = await getAllProductDio();
    List<HomeProduct> list = data.toList().cast<HomeProduct>();

    setState(() {
      productRes = list;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<HomeProduct> productList = getDefaultProducts();

    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: (1 / 1.4),
        padding: const EdgeInsets.all(10),
        children: [...products(productList)]);
  }

  List<Widget> products(List<HomeProduct> productList) => isLoading
      ? productList
          .map((product) => Product(
                id: product.slug,
                name: product.name,
                price: product.price,
                src: product.image,
                salePrice: '',
                isLoading: true,
              ))
          .toList()
      : productRes
          .map((el) => Product(
              src: el.image,
              name: el.name,
              price: el.price,
              id: el.slug,
              salePrice: '',
              isLoading: false))
          .toList();
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<ProductModel> productList = getAllProduct();

//     return GridView.count(
//         crossAxisCount: 2,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//         childAspectRatio: (1 / 1.4),
//         padding: const EdgeInsets.all(10),
//         children: [...products(productList)]);
//   }

//   List<Widget> products(List<ProductModel> productList) => productList
//       .map((product) => Product(
//             authorName: product.authorName,
//             id: product.id,
//             name: product.name,
//             price: product.price,
//             src: product.image,
//           ))
//       .toList();
// }
