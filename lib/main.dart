import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyek4_nera/routes/app_pages.dart';
import 'package:proyek4_nera/routes/app_routes.dart';
import 'package:proyek4_nera/widgets/base_page.dart';
import 'package:proyek4_nera/widgets/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // home: BasePage(),
      initialRoute: RouteName.login,
      getPages: AppPages.pages,
      // getPages: AppPages.pages,
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
      home: BasePage(),
    );
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              home: BasePage(),
              // initialRoute: AppPages.INITIAL,
              // getPages: AppPages.routes,
              theme: ThemeData(
                pageTransitionsTheme: PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                  },
                ),
              ),
            );
          }
        });
  }
}
