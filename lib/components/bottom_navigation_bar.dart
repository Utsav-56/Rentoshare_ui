import 'package:flutter/material.dart';
import 'package:rentoshare/routes/app_router.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavItem {
  final String label;
  final IconData icon;
  final String route;

  const BottomNavItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

const List<BottomNavItem> bottomNavItems = [
  BottomNavItem(label: "Home", icon: Icons.home, route: AppRoutes.HOME),
  BottomNavItem(label: "Profile", icon: Icons.person, route: AppRoutes.LOGIN),
  BottomNavItem(
    label: "Settings",
    icon: Icons.settings,
    route: AppRoutes.SETTINGS,
  ),
  // Add more here easily
];

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  RxInt _getCurrentIndex() {
    final currentRoute = Get.currentRoute;
    final index = bottomNavItems.indexWhere(
      (item) => item.route == currentRoute,
    );
    return (index >= 0 ? index : 0).obs;
  }

  void _onItemTapped(int index) {
    final selectedRoute = bottomNavItems[index].route;

    if (selectedRoute != Get.currentRoute) {
      AppRouter.to(selectedRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentIndex = _getCurrentIndex().value;

      return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: bottomNavItems.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          );
        }).toList(),
      );
    });
  }
}
