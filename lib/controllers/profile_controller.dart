import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<String> menuProfile = ['Ganti Password', 'Tanya Nera', 'Akhiri Sesi'];
  RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void showHidePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }
}
