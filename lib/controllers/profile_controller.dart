import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proyek4_nera/models/auth_model.dart';
import 'package:proyek4_nera/providers/profile_provider.dart';
import 'package:proyek4_nera/routes/app_routes.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../utils/access_token.dart';

class ProfileController extends GetxController {
  List<String> menuProfile = ['Ganti Password', 'Tanya Nera', 'Akhiri Sesi'];
  Rx<AuthModel> auth = AuthModel(
    user: User(
      id: 0,
      nim: '',
      na: '',
      namaBagus: '',
      avatar: '',
      email: '',
      name: '',
      year: '',
      emailVerifiedAt: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    accessToken: '',
  ).obs;

  bool isLogin = false;
  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordVisibleNew = false.obs;
  RxBool isPasswordVisibleConfirm = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void showHidePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void showHidePasswordNew() {
    isPasswordVisibleNew.value = !isPasswordVisibleNew.value;
    update();
  }

  void showHidePasswordConfirm() {
    isPasswordVisibleConfirm.value = !isPasswordVisibleConfirm.value;
    update();
  }

  void login(BuildContext context, String email, String password) {
    ProfileProvider().login(email, password).then((value) {
      if (value != null) {
        auth.value = value;
        accessToken = auth.value.accessToken;
        isLogin = true;
        Get.offNamed(RouteName.basePage);
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: 'Email atau password salah',
          ),
        );
      }
    });
  }

  void logout() {
    ProfileProvider().logout().then((value) {
      Get.offAllNamed(RouteName.login);
    });
  }

  void changePassword(
      BuildContext context, String newPassword, String confirmPassword) {
    if (newPassword != confirmPassword) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Password baru dan konfirmasi password tidak sama",
        ),
      );
    }
  }
}
