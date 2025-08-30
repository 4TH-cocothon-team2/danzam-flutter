import '../get_dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> fetchUserData() async {
  try {
    final dio = getDio();
    final response = await dio.get('/users');
    return response.data;
  } catch (e) {
    debugPrint('fetchUserData Error: $e');
    rethrow;
  }
}
