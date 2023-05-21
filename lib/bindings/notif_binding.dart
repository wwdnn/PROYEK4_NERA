import 'package:get/get.dart';

import '../controllers/notif_controller.dart';

class NotifB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifC>(
      () => NotifC(),
    );
  }
}
