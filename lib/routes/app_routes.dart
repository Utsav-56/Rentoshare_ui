import 'package:flutter/widgets.dart' show Widget;
import 'package:get/get.dart';
import 'package:rentoshare/scaffolds/app_scaffold.dart';
import 'package:rentoshare/dashboard/widgets/rentals/my_rentals_view.dart';

import 'package:rentoshare/pages/404_page.dart';
import 'package:rentoshare/pages/auth/signup_page.dart';
import 'package:rentoshare/dashboard/dashboard_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AppRoutes {
  static const String HOME = '/';
  static const String DASHBOARD = '/dashboard';
  static const String DASHBOARD_OVERVIEW = '/dashboard/overview';
  static const String DASHBOARD_LISTINGS = '/dashboard/listings';
  static const String DASHBOARD_RENTALS = '/dashboard/rentals';
  static const String DASHBOARD_MESSAGES = '/dashboard/messages';
  static const String DASHBOARD_REVIEWS = '/dashboard/reviews';
  static const String DASHBOARD_WALLET = '/dashboard/wallet';
  static const String DASHBOARD_SETTINGS = '/dashboard/settings';

  static const String MARKETPLACE = '/marketplace';
  static const String MY_LISTINGS = '/my-listings';
  static const String MY_RENTALS = '/my-rentals';
  static const String MESSAGES = '/messages';
  static const String PROFILE = '/profile';
  static const String SETTINGS = '/settings';
  static const String HELP = '/help';
  static const String LOGIN = '/login';

  static const String SIGNUP = '/signup';
  static const String LOGOUT = '/logout';

  static const String FALLBACK = '/fallback';
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
