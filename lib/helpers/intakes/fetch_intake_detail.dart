import '../get_dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> fetchIntakeDetail(int intake_id) async {
  try {
    final dio = getDio();
    final response = await dio.get('/intakes/$intake_id');
    return response.data;
  } catch (e) {
    debugPrint("fetchIntakeDetail Error: $e");
    rethrow;
  }
}
