import 'package:Danzam/services/get_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> addUserData(Map<String, dynamic> userData) async {
  try {
    final dio = getDio();
    final formData = FormData.fromMap(userData);
    final response = await dio.post('/users', data: formData);
    return response.data;
  } catch (e) {
    debugPrint('addUserData Error: $e');
    rethrow;
  }
}
