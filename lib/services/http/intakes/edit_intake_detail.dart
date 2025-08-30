import 'package:Danzam/services/get_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> editIntakeDetail(
  int intake_id,
  Map<String, dynamic> map,
) async {
  try {
    final dio = getDio();
    final formData = FormData.fromMap(map);

    final response = await dio.patch('/intakes/$intake_id', data: formData);
    return response.data;
  } catch (e) {
    debugPrint('editIntakeDetail Error: $e');
    rethrow;
  }
}
