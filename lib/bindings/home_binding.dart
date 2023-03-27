import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeC>(
      () => HomeC(),
    );
  }
}
