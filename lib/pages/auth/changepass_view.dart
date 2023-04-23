// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/profile_controller.dart';

class ChangePassView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final profileC = Get.find<ProfileController>();
    return Scaffold(
      body: Obx(() {
        return Container(
          decoration: BoxDecoration(color: Color(0xFF345FB4)),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  height: Get.height * 0.15,
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      title: Text(
                        "GANTI PASSWORD",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Get.back(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: MediaQuery.of(context).viewInsets.bottom == 0
                        ? DecorationImage(
                            image: AssetImage("assets/logo/vector_bg.png"),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.bottomCenter,
                          )
                        : null,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // input password lama
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: TextField(
                            controller: profileC.passwordController,
                            decoration: InputDecoration(
                              labelText: "Password Lama",
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              // icon password show/hide
                              suffixIcon: IconButton(
                                icon: Icon(
                                  profileC.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  profileC.showHidePassword();
                                },
                              ),
                            ),
                            obscureText: !profileC.isPasswordVisible.value,
                          ),
                        ),
                        // input password baru
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: TextField(
                            controller: profileC.newPasswordController,
                            decoration: InputDecoration(
                              labelText: "Password Baru",
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              // icon password show/hide
                              suffixIcon: IconButton(
                                icon: Icon(
                                  profileC.isPasswordVisibleNew.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  profileC.showHidePasswordNew();
                                },
                              ),
                            ),
                            obscureText: !profileC.isPasswordVisibleNew.value,
                          ),
                        ),
                        // input konfirmasi password baru
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: TextField(
                            controller: profileC.confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: "Konfirmasi Password Baru",
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              // icon password show/hide
                              suffixIcon: IconButton(
                                icon: Icon(
                                  profileC.isPasswordVisibleConfirm.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  profileC.showHidePasswordConfirm();
                                },
                              ),
                            ),
                            obscureText:
                                !profileC.isPasswordVisibleConfirm.value,
                          ),
                        ),
                        // tombol simpan
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              profileC.changePassword(
                                context,
                                profileC.newPasswordController.text,
                                profileC.confirmPasswordController.text,
                              );
                            },
                            child: Text("Simpan Perubahan"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF345FB4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fixedSize: Size(Get.width, 50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
