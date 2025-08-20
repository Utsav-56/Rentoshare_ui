import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/routes/app_router.dart';

class AppNavigationController extends GetxController {
  // Navigation state
  var isSidebarMode = true.obs;
  var isIconOnlyMode = false.obs;
  var currentRoute = ''.obs;
  var hideAppsNavBar = false.obs;

  // Styling constants
  static const double _iconOnlyWidth = 72.0;
  static const double _expandedWidth = 200.0;
  static const double _iconSize = 24.0;

  // Active item styling constants
  static const double _activeItemOpacity = 0.12;

  void toggleIconsOnlyMode() {
    isIconOnlyMode.value = !isIconOnlyMode.value;
  }

  void toggleSidebarMode() {
    isSidebarMode.value = !isSidebarMode.value;
  }

  void setSidebarMode(bool enabled) {
    isSidebarMode.value = enabled;
  }

  double get sidebarWidth =>
      isIconOnlyMode.value ? _iconOnlyWidth : _expandedWidth;

  bool isRouteActive(String? route) {
    if (route == null) return false;
    return AppRouter.isActiveRoute(route);
  }

  bool isAnyRouteActive(List<String> routes) {
    return AppRouter.isAnyRouteActive(routes);
  }

  Color getItemBackgroundColor(BuildContext context, bool isActive) {
    return isActive
        ? Theme.of(context).colorScheme.primary.withOpacity(_activeItemOpacity)
        : Colors.transparent;
  }

  Color getItemIconColor(BuildContext context, bool isActive) {
    return isActive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface;
  }

  Color getItemTextColor(BuildContext context, bool isActive) {
    return isActive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface;
  }

  Widget getLeadingIcon(BuildContext context) {
    return Obx(() {
      if (isSidebarMode.value) {
        // Desktop mode - show toggle icon for sidebar
        return IconButton(
          icon: Icon(
            isIconOnlyMode.value ? Icons.chevron_right : Icons.chevron_left,
            color: Theme.of(context).colorScheme.onSurface,
            size: _iconSize,
          ),
          onPressed: toggleIconsOnlyMode,
          tooltip: isIconOnlyMode.value ? 'Expand sidebar' : 'Collapse sidebar',
        );
      } else {
        // Mobile mode - show menu icon for drawer
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        );
      }
    });
  }

  // Method to check if main app navigation should be hidden
  bool shouldHideMainNavigation() {
    return hideAppsNavBar.value;
  }
}
