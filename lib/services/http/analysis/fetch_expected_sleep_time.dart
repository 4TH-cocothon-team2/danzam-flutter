import 'package:Danzam/services/get_dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> fetchExpectedSleepTime() async {
  try {
    final dio = getDio();
    final response = await dio.get('/analysis');
    return response.data;
  } catch (e) {
    debugPrint("fetchExpectedSleepTime Error: $e");
    rethrow;
  }
}
