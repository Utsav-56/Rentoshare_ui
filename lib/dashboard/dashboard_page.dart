import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/components/app_drawer.dart';
import 'package:rentoshare/controllers/app_navigation_controller.dart';
import 'package:rentoshare/dashboard/controllers/dashboard_controller.dart';
import 'package:rentoshare/dashboard/widgets/dashboard_app_bar.dart';
import 'package:rentoshare/dashboard/widgets/dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // Layout constants
  static const double _tabletBreakpoint = 600.0;

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());
    final navController = Get.put(NavigationController());

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if we should use sidebar mode based on screen width
        final bool shouldUseSidebar = constraints.maxWidth > _tabletBreakpoint;

        // Update the navigation controller based on screen size
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navController.setSidebarMode(shouldUseSidebar);
        });

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: const DashboardAppBar(),
          drawer: shouldUseSidebar ? null : const AppDrawer(),
          body: shouldUseSidebar
              ? Row(
                  children: [
                    const AppSidebar(),
                    Expanded(
                      child: DashboardContent(
                        selectedIndex:
                            dashboardController.selectedMenuIndex.value,
                      ),
                    ),
                  ],
                )
              : DashboardContent(
                  selectedIndex: dashboardController.selectedMenuIndex.value,
                ),
        );
      },
    );
  }
}
