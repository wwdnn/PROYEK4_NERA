// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

// Import Binding
import '../bindings/departments_binding.dart';
import '../bindings/events_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/notif_binding.dart';
import '../bindings/profile_binding.dart';

// Import View
import '../pages/auth/auth_view.dart';
import '../pages/auth/changePass_view.dart';
import '../pages/departments_view.dart';
import '../pages/events_view.dart';
import '../pages/home_view.dart';
import '../pages/notif_view.dart';
import '../pages/profile_view.dart';
import '../pages/tanyaNera_view.dart';

import '../widgets/base_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.basePage,
      page: () => BasePage(),
    ),
    GetPage(name: RouteName.home, page: () => HomeV(), binding: HomeB()),
    GetPage(
        name: RouteName.departments,
        page: () => DepartmentsView(),
        binding: DepartementsBinding()),
    GetPage(
        name: RouteName.events,
        page: () => EventsView(),
        binding: EventsBinding()),
    GetPage(
        name: RouteName.profile,
        page: () => ProfileView(),
        binding: ProfileBinding()),
    GetPage(
      name: RouteName.login,
      page: () => AuthView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RouteName.changePassword,
      page: () => ChangePassView(),
    ),
    GetPage(
      name: RouteName.tanyaNera,
      page: () => TanyaNeraView(),
    ),
    GetPage(
      name: RouteName.notif,
      page: () => NotifView(),
      binding: NotifB(),
    )
  ];
}
