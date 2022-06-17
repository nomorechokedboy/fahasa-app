import 'package:fahasa_app/api/product.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'product_image.dart';

class Product extends StatelessWidget {
  final String src;
  final String id;
  final String name;
  final String price;
  final String salePrice;
  final bool isLoading;
  const Product(
      {Key? key,
      required this.src,
      required this.name,
      required this.price,
      required this.id,
      required this.salePrice,
      required this.isLoading})
      : super(key: key);

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
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: ProductImage(
                isLoading: isLoading,
                src: src,
              ),
            ),
            renderProductName(isLoading, context),
            renderPrice(isLoading, context)
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ));
  }

  Widget renderProductName(bool isLoading, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: isLoading
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 18.0,
                color: Colors.white,
              ),
            )
          : Text(name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1),
    );
  }

  Widget renderPrice(bool isLoading, BuildContext context) {
    if (isLoading) {
      return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Theme.of(context).primaryColor,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 72.0,
                  height: 20.0,
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 60.0,
                  height: 20.0,
                  color: Colors.white,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ));
    }

    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Container(
              child: Text(
                price,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD22121)),
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(5),
            ),
            salePrice == ''
                ? Text(salePrice,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ))
                : const SizedBox.shrink()
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }

  Future<void> fetch() async {
    var test = await getAllProductDio();
    print(test);
  }
}
