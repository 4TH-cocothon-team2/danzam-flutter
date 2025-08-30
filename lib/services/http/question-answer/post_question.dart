import 'package:Danzam/services/get_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> postQuestion(Map<String, dynamic> map) async {
  try {
    final dio = getDio();
    final formData = FormData.fromMap(map);
    final response = await dio.post('/question-answer', data: map);
    return response.data;
  } catch (e) {
    debugPrint('postQuestion Error: $e');
    rethrow;
  }
}
