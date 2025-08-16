import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DrawerItem {
  final String label;
  final IconData icon;
  final String? route;
  final List<String>?
  routes; // For items that should be active on multiple routes
  final VoidCallback? onTap;
  final bool isHeader;

  const DrawerItem({
    required this.label,
    required this.icon,
    this.route,
    this.routes,
    this.onTap,
    this.isHeader = false,
  });

  bool isActive(String currentRoute) {
    if (route != null && route == currentRoute) return true;
    if (routes != null && routes!.contains(currentRoute)) return true;
    return false;
  }
}

class DrawerItems {
  // Header items
  static const List<DrawerItem> headItems = [
    DrawerItem(label: "RentoShare", icon: Icons.share_rounded, isHeader: true),
  ];

  // Main navigation items
  static const List<DrawerItem> topItems = [
    DrawerItem(
      label: "Dashboard",
      icon: Icons.dashboard_rounded,
      route: AppRoutes.DASHBOARD,
      routes: [AppRoutes.DASHBOARD, '/dashboard/overview'],
    ),
    DrawerItem(
      label: "Marketplace",
      icon: Icons.storefront_rounded,
      route: AppRoutes.MARKETPLACE,
      routes: [AppRoutes.MARKETPLACE, '/marketplace/browse'],
    ),
    DrawerItem(
      label: "My Listings",
      icon: Icons.list_alt_rounded,
      route: AppRoutes.MY_LISTINGS,
      routes: [AppRoutes.MY_LISTINGS, '/listings/manage'],
    ),
    DrawerItem(
      label: "My Rentals",
      icon: Icons.shopping_bag_rounded,
      route: AppRoutes.MY_RENTALS,
      routes: [AppRoutes.MY_RENTALS, '/rentals/active'],
    ),
    DrawerItem(
      label: "Messages",
      icon: Icons.message_rounded,
      route: AppRoutes.MESSAGES,
      routes: [AppRoutes.MESSAGES, '/chat'],
    ),
    DrawerItem(
      label: "Profile",
      icon: Icons.person_rounded,
      route: AppRoutes.PROFILE,
      routes: [AppRoutes.PROFILE, '/profile/edit'],
    ),
  ];

  // Bottom items
  static const List<DrawerItem> bottomItems = [
    DrawerItem(
      label: "Settings",
      icon: Icons.settings_rounded,
      route: AppRoutes.SETTINGS,
    ),
    DrawerItem(
      label: "Help & Support",
      icon: Icons.help_rounded,
      route: AppRoutes.HELP,
    ),
    DrawerItem(
      label: "Logout",
      icon: Icons.logout_rounded,
      route: AppRoutes.LOGIN,
    ),
  ];
}
