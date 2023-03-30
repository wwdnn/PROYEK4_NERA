// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

// Import Binding
import '../bindings/departments_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/profile_binding.dart';

// Import View
import '../pages/departments_view.dart';
import '../pages/home_view.dart';
import '../pages/profile_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home, 
      page: () => HomeV(), 
      binding: HomeB()
    ),
    GetPage(
      name: RouteName.departments, 
      page: () => DepartmentsView(), 
      binding: DepartementsBinding()
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfileView(),
      binding: ProfileBinding()
    )
  ];
}
