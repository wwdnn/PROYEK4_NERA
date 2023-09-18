import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyek4_nera/controllers/notif_controller.dart';
import 'package:proyek4_nera/routes/app_pages.dart';
import 'package:proyek4_nera/routes/app_routes.dart';
import 'package:proyek4_nera/widgets/base_page.dart';
import 'package:proyek4_nera/widgets/splash.dart';
import 'controllers/profile_controller.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 5)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: profileC.isLogin == false
                  ? RouteName.login
                  : RouteName.basePage,
              getPages: AppPages.pages,
              theme: ThemeData(
                pageTransitionsTheme: PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                  },
                ),
                inputDecorationTheme: InputDecorationTheme(
                  focusColor: Color(0xFF345FB4),
                ),
              ),
            );
          }
        });
  }
}
