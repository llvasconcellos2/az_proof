import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const kInitial = Routes.kHome;

  static final routes = [
    GetPage(
      name: _Paths.kHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.kLogin,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
