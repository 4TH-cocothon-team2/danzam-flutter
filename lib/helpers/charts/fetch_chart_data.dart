import 'package:cokothon25/helpers/get_dio.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> fetchChartData() async {
  try {
    final dio = getDio();
    final response = await dio.get('/charts');
    return response.data;
  } catch (e) {
    debugPrint("fetchChartData Error: $e");
    rethrow;
  }
}
