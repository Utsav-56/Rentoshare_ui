import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DrawerItem {
  final String label;
  final IconData icon;
  final String? route;
  final VoidCallback? onTap;

  const DrawerItem({
    required this.label,
    required this.icon,
    this.route,
    this.onTap,
  });
}

class DrawerItems {
  static const headItems = [
    DrawerItem(label: "Utsav", icon: Icons.account_circle),
  ];

  static const topItems = [
    DrawerItem(label: "Home", icon: Icons.home, route: AppRoutes.HOME),
    DrawerItem(label: "Profile", icon: Icons.person, route: AppRoutes.LOGIN),
    DrawerItem(
      label: "Settings",
      icon: Icons.settings,
      route: AppRoutes.SETTINGS,
    ),
  ];

  static const bottomItems = [
    DrawerItem(label: "v1.0.0", icon: Icons.info_outline),
    DrawerItem(label: "made by utsav-56", icon: Icons.info_outline),
  ];
}
