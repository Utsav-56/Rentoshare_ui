import 'package:flutter/widgets.dart' show Widget;
import 'package:get/get.dart';
import 'package:rentoshare/MyApp.dart';
import 'package:rentoshare/dashboard/widgets/rentals/my_rentals_view.dart';

import 'package:rentoshare/pages/404_page.dart';
import 'package:rentoshare/pages/auth/signup_page.dart';
import 'package:rentoshare/dashboard/dashboard_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AppRoutes {
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String SETTINGS = '/settings';
  static const String FALLBACK = '/fallback';
  static const String SIGNUP = '/signup';
  static const String DASHBOARD = '/dashboard';

  // Dashboard routes
  static const String MARKETPLACE = '/marketplace/browse';
  static const String MY_LISTINGS = '/listings/manage';
  static const String MY_RENTALS = '/rentals/active';
  static const String MESSAGES = '/chat';
  static const String PROFILE = '/profile/edit';

  static const String HELP = '/help';
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

    // Dashboard routes
    AppRoutes.MY_RENTALS: MyRentalsView(),
    AppRoutes.MARKETPLACE: const NotFoundPage(),
    AppRoutes.MY_LISTINGS: const NotFoundPage(),
    AppRoutes.MESSAGES: const NotFoundPage(),
    AppRoutes.PROFILE: const NotFoundPage(),
    AppRoutes.HELP: const NotFoundPage(),
  };

  static Widget get(String routeName) =>
      routes[routeName] ?? const NotFoundPage();

  static final titles = {
    AppRoutes.HOME: "Home",
    AppRoutes.LOGIN: "Login",
    AppRoutes.FALLBACK: "404",
    AppRoutes.SIGNUP: "Signup",
    AppRoutes.DASHBOARD: "Dashboard",
    AppRoutes.MARKETPLACE: "Marketplace",
    AppRoutes.MY_LISTINGS: "My Listings",
    AppRoutes.MY_RENTALS: "My Rentals",
    AppRoutes.MESSAGES: "Messages",
    AppRoutes.PROFILE: "Profile",
    AppRoutes.HELP: "Help",
  };

  static String getTitle(String routeName) => titles[routeName] ?? "404";

  static List<GetPage> get getPages => routes.entries
      .map(
        (entry) => GetPage(
          name: entry.key,
          page: () =>
              RentoShareApp(title: getTitle(entry.key), child: get(entry.key)),
        ),
      )
      .toList();

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

    // Add more GetPages here
  ];
}
