import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/departments_model.dart';
import '../utils/base_url.dart';

class DepartmentsProvider extends GetConnect {
  Future<dynamic> getDepartments() async {
    final response =
        await rootBundle.loadString('assets/sample_departments.json');
    final departmentsModel = departmentsModelFromJson(response);

    return departmentsModel;
  }
}
