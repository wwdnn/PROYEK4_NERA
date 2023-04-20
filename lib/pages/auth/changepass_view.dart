// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChangePassView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
                  image: DecorationImage(
                    image: MediaQuery.of(context).viewInsets.bottom == 0
                        ? AssetImage("assets/logo/vector_bg.png")
                        : AssetImage(""),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
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
                          decoration: InputDecoration(
                            labelText: "Password Lama",
                            labelStyle: TextStyle(
                              color: Color(0xFF345FB4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF345FB4)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF345FB4)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      // input password baru
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Password Baru",
                            labelStyle: TextStyle(
                              color: Color(0xFF345FB4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF345FB4)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF345FB4)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      // input konfirmasi password baru
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Konfirmasi Password Baru",
                            labelStyle: TextStyle(
                              color: Color(0xFF345FB4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF345FB4)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF345FB4)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      // tombol simpan
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {},
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
      ),
    );
  }
}
