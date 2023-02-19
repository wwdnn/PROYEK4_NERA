import 'package:get/get.dart';

import 'package:proyek4_nera/app/modules/departemen/bindings/departemen_binding.dart';
import 'package:proyek4_nera/app/modules/departemen/views/departemen_view.dart';
import 'package:proyek4_nera/app/modules/home/bindings/home_binding.dart';
import 'package:proyek4_nera/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTEMEN,
      page: () => DepartemenView(),
      binding: DepartemenBinding(),
    ),
  ];
}
