import 'package:cokothon25/helpers/get_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<void> addUserData(Map<String, dynamic> userData) async {
  try {
    final dio = getDio();
    final formData = FormData.fromMap(userData);
    final response = await dio.post('/users', data: formData);
  } catch (e) {
    debugPrint('addUserData Error: $e');
    rethrow;
  }
}
