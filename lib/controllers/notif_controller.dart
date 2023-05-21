import 'package:get/get.dart';

class NotifC extends GetxController {
  // list of notif
  RxList notif = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  void addNotif(String title, String body) {
    notif.add({
      'title': title,
      'body': body,
    });
    print(notif);
    update();
  }

  void removeNotif(int index) {
    notif.removeAt(index);
    update();
  }
}
