import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String src;
  const ProductImage({Key? key, required this.src}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
