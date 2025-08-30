import 'package:dio/dio.dart';

Dio getDio() {
  final dio = Dio();
  dio.options.baseUrl = '';
  dio.options.headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  return dio;
}
