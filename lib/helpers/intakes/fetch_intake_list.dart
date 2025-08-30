import 'package:cokothon25/helpers/get_dio.dart';
import 'package:flutter/foundation.dart';

Future<List<Map<String, dynamic>>> fetchIntakeList() async {
  try {
    final dio = getDio();
    final response = await dio.get('/intakes');
    return response.data;
  } catch (e) {
    debugPrint("fetchIntakeList Error: $e");
    rethrow;
  }
}
