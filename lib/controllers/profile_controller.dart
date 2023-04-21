import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proyek4_nera/providers/profile_provider.dart';
import 'package:proyek4_nera/routes/app_routes.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileController extends GetxController {
  List<String> menuProfile = ['Ganti Password', 'Tanya Nera', 'Akhiri Sesi'];
  RxBool isPasswordVisible = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void showHidePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void login(BuildContext context, String email, String password) {
    ProfileProvider().login(email, password).then((value) {
      if (value != null) {
        Get.offNamed(RouteName.home);
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Email atau Password salah",
          ),
        );
      }
    });
  }

  void logout() {
    Get.offAllNamed(RouteName.login);
  }
}
