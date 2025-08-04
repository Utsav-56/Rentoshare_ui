import 'package:get/get.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AppRoutes {
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String SETTINGS = '/settings';
  // Add more as needed

  static final List<GetPage> routes = [
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(name: LOGIN, page: () => const LoginPage()),
    // Add more GetPages here
  ];
}

class AppPages {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.HOME, page: () => const HomePage()),
    GetPage(name: AppRoutes.LOGIN, page: () => const LoginPage()),
    // Add more GetPages here
  ];
}
