import 'package:get/get.dart';
import 'package:rentoshare/pages/404_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AppRoutes {
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String SETTINGS = '/settings';
  static const String FALLBACK = '/fallback';
  // Add more as needed
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.FALLBACK, page: () => const NotFoundPage()),
    GetPage(name: AppRoutes.HOME, page: () => const HomePage()),
    GetPage(name: AppRoutes.LOGIN, page: () => const LoginPage()),

    // Add more GetPages here
  ];
}
