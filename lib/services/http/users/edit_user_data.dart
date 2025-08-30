import 'package:Danzam/services/get_dio.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<void> editUserData(Map<String, dynamic> map) async {
  try {
    final dio = getDio();
    final formData = FormData.fromMap(map);
    final response = await dio.patch('/users', data: formData);
  } catch (e) {
    debugPrint('editUserData Error: $e');
    rethrow;
  }
}
