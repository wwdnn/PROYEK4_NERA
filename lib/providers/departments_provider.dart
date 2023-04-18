import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/base_url.dart';

class DepartmentsProvider extends GetConnect {
  Future<dynamic> getDepartments() async {
    final response = await get('$BaseUrl/departments');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
