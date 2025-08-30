import 'package:flutter/foundation.dart';

import '../../get_dio.dart';

Future<Map<String, dynamic>> fetchBodyCaffeineData() async {
  try {
    final dio = getDio();
    final response = await dio.get('/analysis');
    return response.data;
  } catch (e) {
    debugPrint("fetchBodyCaffeineData Error: $e");
    rethrow;
  }
}
