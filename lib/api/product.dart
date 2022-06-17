import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fahasa_app/configs/dio.dart';

import '../models/product.dart';
import '../configs/env.dart';

getDefaultProducts() => [
      HomeProduct(
          'T.R Roul',
          '1',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          test,
          '30.000 d'),
      HomeProduct(
          'Akutami Gege',
          '2',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          'Jujutsu iasen chapter 15',
          '30.000 d'),
      HomeProduct(
          'T.R Roul',
          '1',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          test,
          '30.000 d'),
      HomeProduct(
          'Akutami Gege',
          '2',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          'Jujutsu iasen chapter 15',
          '30.000 d'),
      HomeProduct(
          'T.R Roul',
          '1',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          test,
          '30.000 d'),
      HomeProduct(
          'Akutami Gege',
          '2',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          'Jujutsu iasen chapter 15',
          '30.000 d'),
      HomeProduct(
          'T.R Roul',
          '1',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          test,
          '30.000 d'),
      HomeProduct(
          'Akutami Gege',
          '2',
          'https://64.media.tumblr.com/343ea1e0fe486d7603db4e2cc55cdd53/ee221588345d98ac-20/s1280x1920/73cda4e122b6f1457573dba335f27c4a22d85836.jpg',
          'Jujutsu iasen chapter 15',
          '30.000 d'),
    ];

Future<List<dynamic>> getAllProductDio() =>
    dio.get('product').then((value) => value.data
        .where((el) => el['deleted'] == false)
        .toList()
        .map((product) => HomeProduct(
              product['_id'],
              product['image'],
              product['name'],
              product['price'][0]['priceInText'],
              product['slug'],
            ))
        .toList());
