import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

enum ToastType { success, error, warning, info }

class Notifier {
  static void showToast(
    String message, {
    String? title,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
    bool dismissible = true,
  }) {
    final toastificationType = {
      ToastType.success: ToastificationType.success,
      ToastType.error: ToastificationType.error,
      ToastType.warning: ToastificationType.warning,
      ToastType.info: ToastificationType.info,
    }[type];

    final icon = {
      ToastType.success: Icons.check_circle_outline,
      ToastType.error: Icons.error_outline,
      ToastType.warning: Icons.warning_amber_outlined,
      ToastType.info: Icons.info_outline,
    }[type];

    toastification.show(
      type: toastificationType,
      style: ToastificationStyle.fillColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.bottomLeft,
      autoCloseDuration: const Duration(seconds: 4),
      icon: Icon(icon),
      borderRadius: BorderRadius.circular(100.0),
      boxShadow: highModeShadow,
      applyBlurEffect: true,
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(),
      padding: EdgeInsets.only(left: 8, right: 8),
    );
  }

  static void showSnackbar(
    String title,
    String message, {
    ToastType type = ToastType.info,
  }) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case ToastType.success:
        backgroundColor = Colors.green;
        icon = Icons.check_circle_outline;
        break;
      case ToastType.error:
        backgroundColor = Colors.red;
        icon = Icons.error_outline;
        break;
      case ToastType.warning:
        backgroundColor = Colors.orange;
        icon = Icons.warning_amber_outlined;
        break;
      case ToastType.info:
      default:
        backgroundColor = Colors.grey[800]!;
        icon = Icons.info_outline;
        break;
    }

    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: Colors.white),
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      mainButton: TextButton(
        onPressed: () => Get.closeAllSnackbars(),
        child: const Icon(Icons.close, color: Colors.white),
      ),
    );
  }

  static void showDialogBox({
    required String title,
    required String message,
    ToastType type = ToastType.info,
    String confirmText = "OK",
    VoidCallback? onConfirm,
  }) {
    IconData icon;
    Color iconColor;

    switch (type) {
      case ToastType.success:
        icon = Icons.check_circle_outline;
        iconColor = Colors.green;
        break;
      case ToastType.error:
        icon = Icons.error_outline;
        iconColor = Colors.red;
        break;
      case ToastType.warning:
        icon = Icons.warning_amber_outlined;
        iconColor = Colors.orange;
        break;
      case ToastType.info:
      default:
        icon = Icons.info_outline;
        iconColor = Colors.blue;
        break;
    }

    Get.defaultDialog(
      title: title,
      content: Column(
        children: [
          Icon(icon, size: 48, color: iconColor),
          const SizedBox(height: 10),
          Text(message),
        ],
      ),
      textConfirm: confirmText,
      confirmTextColor: Colors.white,
      buttonColor: iconColor,
      onConfirm: () {
        Get.back();
        onConfirm?.call();
      },
    );
  }
}
