import 'dart:convert';

import 'package:get/get.dart';

import '../models/departments_model.dart';
import '../utils/access_token.dart';
import '../utils/base_url.dart';

class DepartmentsProvider extends GetConnect {
  Future<dynamic> getDepartments() async {
    final response = await get('$BaseUrl/departments', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final departmentsModel = departmentsModelFromJson(responseString);
      return departmentsModel;
    }
    return null;
  }
}
