import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  static Future<T?> to<T>(String routeName, {dynamic arguments}) async {
    return Get.toNamed<T>(routeName, arguments: arguments);
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
