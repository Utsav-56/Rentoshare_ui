import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/routes/app_router.dart';

class NavigationController extends GetxController {
  // Navigation state
  var isSidebarMode = true.obs;
  var isIconOnlyMode = false.obs;
  var currentRoute = ''.obs;
  var hideAppsNavBar = false.obs; // Changed to false initially

  // Routes where the main app navigation should be hidden
  static const List<String> _hideNavBarRoutes = [
    '/dashboard',
    '/dashboard/overview',
    '/dashboard/listings',
    '/dashboard/rentals',
    '/dashboard/messages',
    '/dashboard/reviews',
    '/dashboard/wallet',
    '/dashboard/settings',
  ];

  // Styling constants
  static const double _iconOnlyWidth = 72.0;
  static const double _expandedWidth = 200.0;
  static const double _iconSize = 24.0;
  static const double _headerIconSize = 28.0;
  static const double _itemPadding = 16.0;
  static const double _iconPadding = 8.0;
  static const double _verticalMargin = 4.0;
  static const double _horizontalMargin = 8.0;
  static const double _borderRadius = 8.0;
  static const double _tooltipDelay = 500.0;

  // Text styling constants
  static const double _headerFontSize = 18.0;
  static const double _itemFontSize = 14.0;
  static const FontWeight _headerFontWeight = FontWeight.bold;
  static const FontWeight _itemFontWeight = FontWeight.normal;

  // Active item styling constants
  static const double _activeItemOpacity = 0.12;
  static const double _inactiveItemOpacity = 0.0;

  @override
  void onInit() {
    super.onInit();
    // Initialize current route and update navigation visibility
    currentRoute.value = Get.currentRoute;
    _updateNavBarVisibility();

    // Listen to route changes
    ever(currentRoute, (route) {
      _updateNavBarVisibility();
    });
  }

  @override
  void onReady() {
    super.onReady();
    // Ensure we update visibility when controller is ready
    _updateNavBarVisibility();
  }

  void _updateNavBarVisibility() {
    final shouldHide = _shouldHideNavBar(currentRoute.value);
    print(
      'Route: ${currentRoute.value}, Should hide: $shouldHide',
    ); // Debug log
    hideAppsNavBar.value = shouldHide;
  }

  bool _shouldHideNavBar(String route) {
    // Check if the current route matches any of the hide routes
    return _hideNavBarRoutes.any(
      (hideRoute) => route == hideRoute || route.startsWith('$hideRoute/'),
    );
  }

  // Method to manually update the current route (call this from router)
  void updateCurrentRoute(String route) {
    currentRoute.value = route;
  }

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
