import 'package:dio/dio.dart';
import 'package:fahasa_app/constants/globals.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
));
