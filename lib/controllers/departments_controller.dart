import 'package:get/get.dart';

import '../providers/departments_provider.dart';

class DepartmentsController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<dynamic> departmentsData = [].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  // get Data from API
  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 1));
    DepartmentsProvider().getDepartments().then((value) {
      departmentsData.assignAll(value['data']);
      // print(value['data'][0]['users']);
    });
    update();
  }
}
