import 'dart:ffi';

import 'package:fahasa_app/models/author.dart';
import 'package:fahasa_app/models/genre.dart';
import 'package:fahasa_app/models/price.dart';
import 'package:fahasa_app/models/publisher.dart';
import 'package:fahasa_app/models/supplier.dart';

class ProductModel {
  final String id;
  final String name;
  final String authorName;
  final String image;
  final String price;

  ProductModel(this.authorName, this.id, this.image, this.name, this.price);
}

class HomeProduct {
  final String _id;
  // final String sku;
  // final int amount;
  // final Author author;
  final String name;
  final String image;
  final String price;
  final String slug;
  // final Supplier productSupplier;
  // final Publisher publishingCompany;
  // final Array<Genre> genres;

  HomeProduct(this._id, this.image, this.name, this.price, this.slug);
}
