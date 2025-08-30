import 'package:cokothon25/helpers/get_dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> deleteIntakeDetail(int intake_id) async {
  try {
    final dio = getDio();
    final response = await dio.delete('/intakes/$intake_id');
    return response.data;
  } catch (e) {
    debugPrint('deleteIntakeDetail Error: $e');
    rethrow;
  }
}
