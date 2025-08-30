import '../get_dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> getAnswer() async {
  try {
    final dio = getDio();
    final response = await dio.get('/question-answer');
    return response.data;
  } catch (e) {
    debugPrint("getAnswer Error: $e");
    rethrow;
  }
}
