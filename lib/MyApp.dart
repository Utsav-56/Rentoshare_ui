import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/components/app_drawer.dart' show AppDrawer;
import 'package:rentoshare/components/bottom_navigation_bar.dart';
import 'package:rentoshare/controllers/app_navigation_controller.dart';

//  This is a custom wrapper for my app which will wrap the drawer, bottom navigation bar and other persistent widgets
// Will use the getx obx for the state management
class RentoShareApp extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? showDrawer;
  final bool? showBottomNav;

  const RentoShareApp({
    super.key,
    required this.child,
    this.title,
    this.showDrawer = true,
    this.showBottomNav = true,
  });

  // Layout constants
  static const double _tabletBreakpoint = 600.0;
  static const double _sidebarWidth = 240.0;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > _tabletBreakpoint;
    final navController = Get.find<NavigationController>();

    return Obx(() {
      // Check if we should hide the main app navigation
      final shouldHideNavigation = navController.shouldHideMainNavigation();

      if (shouldHideNavigation) {
        // Return the child directly without main app navigation
        return Scaffold(
          body: ClipRect(
            child: child, // Clip to prevent overflow rendering issues
          ),
        );
      }

      // Show main app navigation for non-dashboard routes
      return Scaffold(
        appBar: title != null ? AppBar(title: Text(title!)) : null,
        drawer: (showDrawer ?? true)
            ? (isWide ? null : const AppDrawer())
            : null,
        body: isWide && (showDrawer ?? true)
            ? Row(
                children: [
                  const SizedBox(
                    width: _sidebarWidth,
                    child: AppDrawer(),
                  ), // persistent drawer
                  Expanded(
                    child: ClipRect(
                      child: child, // Clip to prevent overflow rendering issues
                    ),
                  ),
                ],
              )
            : ClipRect(
                child: child, // Clip to prevent overflow rendering issues
              ),
        bottomNavigationBar: (showBottomNav ?? true) ? AppBottomBar() : null,
      );
    });
  }
}
