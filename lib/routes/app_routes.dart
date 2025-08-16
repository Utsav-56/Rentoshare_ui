import 'package:flutter/widgets.dart' show Widget;
import 'package:get/get.dart';
import 'package:rentoshare/MyApp.dart';
import 'package:rentoshare/dashboard/new_dashboard.dart';
import 'package:rentoshare/pages/404_page.dart';
import 'package:rentoshare/pages/auth/signup_page.dart';
import 'package:rentoshare/pages/dashboard/dashboard_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AppRoutes {
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String SETTINGS = '/settings';
  static const String FALLBACK = '/fallback';
  static const String SIGNUP = '/signup';
  static const String DASHBOARD = '/dashboard';
  static const String NEWDASHBOARD = '/newdashboard';
  // Add more as needed
}

class AppPages {
  // Map to store the routes and their corresponding widgets
  static final Map<String, Widget> routes = {
    AppRoutes.HOME: const HomePage(),
    AppRoutes.LOGIN: const LoginPage(),
    AppRoutes.FALLBACK: const NotFoundPage(),
    AppRoutes.SIGNUP: const SignupPage(),
    AppRoutes.DASHBOARD: const DashboardPage(),
    AppRoutes.NEWDASHBOARD: const NewDashboard(),
    // Add more as needed
  };

  static Widget get(String routeName) =>
      routes[routeName] ?? const NotFoundPage();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.FALLBACK,
      page: () => RentoShareApp(title: "404", child: get(AppRoutes.FALLBACK)),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => RentoShareApp(title: "Home", child: get(AppRoutes.HOME)),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => RentoShareApp(
        title: "Login",
        showDrawer: false,
        showBottomNav: false,
        child: get(AppRoutes.LOGIN),
      ),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => RentoShareApp(
        title: "Signup",
        showBottomNav: false,
        showDrawer: false,
        child: get(AppRoutes.SIGNUP),
      ),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => RentoShareApp(
        title: "Dashboard",
        showDrawer: false,
        showBottomNav: false,
        child: get(AppRoutes.DASHBOARD),
      ),
    ),

    GetPage(
      name: AppRoutes.NEWDASHBOARD,
      page: () => RentoShareApp(
        title: "Dashboard",
        showDrawer: false,
        showBottomNav: false,
        child: get(AppRoutes.NEWDASHBOARD),
      ),
    ),

    // Add more GetPages here
  ];
}
