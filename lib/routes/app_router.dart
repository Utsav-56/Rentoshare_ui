import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/app_utils/notifier.dart';
import 'package:rentoshare/routes/app_routes.dart';

// Export app_routes.dart also so that a single import is enough
export './app_routes.dart';

class AppRouter {
  static Future<T?> to<T>(String routeName, {dynamic arguments}) async {
    // Check if the route is already the current route
    if (isActiveRoute(routeName)) {
      return null;
    }

    // Check if the route name exists in our routes
    final exists = AppPages.pages.any((route) => route.name == routeName);
    if (!exists) {
      Notifier.showToast(
        'Route $routeName does not exist in AppPages.routes',
        type: ToastType.error,
      );
      return Get.toNamed<T>(AppRoutes.FALLBACK);
    }

    return Get.toNamed<T>(routeName, arguments: arguments);
  }

  /// Checks if the given [routeName] is currently active in the app.
  ///
  /// Returns `true` if the [routeName] matches the current route,
  /// `false` otherwise.
  ///
  static bool isActiveRoute(String routeName) {
    return Get.currentRoute == routeName;
  }

  static void off(String routeName, {dynamic arguments}) {
    Get.offNamed(routeName, arguments: arguments);
  }

  static void offAll(String routeName, {dynamic arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  static void back<T>({T? result}) {
    Get.back(result: result);
  }

  static Future<T?> push<T>(String routeName, {dynamic arguments}) async {
    return Get.toNamed<T>(routeName, arguments: arguments);
  }

  static void pop<T>({T? result}) {
    Get.back(result: result);
  }

  static void replace(String routeName, {dynamic arguments}) {
    Get.offNamed(routeName, arguments: arguments);
  }

  static void clearAndGo(String routeName, {dynamic arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  static void dialog(Widget dialog) {
    Get.dialog(dialog);
  }

  static void bottomSheet(Widget sheet) {
    Get.bottomSheet(sheet);
  }
}
