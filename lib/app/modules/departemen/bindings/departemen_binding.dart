import 'package:get/get.dart';

import '../controllers/departemen_controller.dart';

class DepartemenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepartemenController>(
      () => DepartemenController(),
    );
  }
}
