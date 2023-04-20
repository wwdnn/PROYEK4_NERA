import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:proyek4_nera/controllers/profile_controller.dart";
import 'package:animated_text_kit/animated_text_kit.dart';

class AuthView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
    return Scaffold(
      body: Obx(() {
        return Container(
          height: Get.height,
          decoration: BoxDecoration(
            color: Color(0xFF345FB4),
          ),
          child: Stack(
            // // position bottom
            // alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logo/Logo_HIMAKOM.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                              "HIMAKOM",
                              textStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text("Hi HIMAKOM",
                            style: GoogleFonts.poppins(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "NIM",
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          keyboardType: TextInputType
                              .number, // menampilkan keyboard numerik
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // membatasi input hanya boleh angka
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Password",
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
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xFF345FB4),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Login",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Lupa Password?",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF345FB4),
                            ),
                          ),
                        ),
                      )
                    ],
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