import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductImage extends StatelessWidget {
  final String src;
  final bool isLoading;

  const ProductImage({Key? key, required this.src, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 150,
          width: 100,
          color: Colors.white,
        ),
      );
    }

    return CachedNetworkImage(
        imageUrl: src,
        width: 100,
        height: 150,
        fit: BoxFit.contain,
        placeholder: (context, url) => const SizedBox.expand(
              child: FittedBox(child: Icon(Icons.image_outlined)),
            ),
        errorWidget: (context, url, error) => const SizedBox.expand(
              child: FittedBox(child: Icon(Icons.image_not_supported_outlined)),
            ));
  }
}
