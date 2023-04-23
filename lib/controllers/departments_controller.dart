import 'package:get/get.dart';

import '../models/departments_model.dart';
import '../providers/departments_provider.dart';

class DepartmentsController extends GetxController {
  Rx<DepartmentsModel> departments = DepartmentsModel(
    status: '',
    data: [],
  ).obs;
  RxInt currentIndex = 0.obs;
  // RxList<dynamic> departmentsData = [].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  // get Data from API
  Future<void> getData() async {
    departments.value = DepartmentsModel(
      status: '',
      data: [],
    );
    await Future.delayed(Duration(seconds: 1));
    DepartmentsProvider().getDepartments().then((value) {
      departments.value = value;
    });
    update();
  }
}
