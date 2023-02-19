import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF345FB4),
        body: Center(
            child: Container(
          height: Get.width * 0.5,
          width: Get.width * 0.5,
          child: Image.asset('assets/logo/Logo.png'),
        )),
      ),
    );
  }
}
