import '../get_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> addIntakeData(Map<String, dynamic> map) async {
  try {
    final dio = getDio();
    final formData = FormData.fromMap(map);
    final response = await dio.post('/intakes', data: map);
    return response.data;
  } catch (e) {
    debugPrint('addIntakeData Error: $e');
    rethrow;
  }
}
