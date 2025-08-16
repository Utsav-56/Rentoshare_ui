import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:rentoshare/pages/dashboard/widgets/dashboard_app_bar.dart';
import 'package:rentoshare/pages/dashboard/widgets/dashboard_drawer.dart';
import 'package:rentoshare/pages/dashboard/widgets/dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());
    final navController = Get.put(DashboardNavController());

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if we should use sidebar mode based on screen width
        final bool shouldUseSidebar = constraints.maxWidth > 600;

        // Update the navigation controller based on screen size
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navController.isSidebarMode.value = shouldUseSidebar;
        });

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: const DashboardAppBar(),
          drawer: shouldUseSidebar ? null : const DashboardDrawer(),
          body: (shouldUseSidebar)
              ? Row(
                  children: [
                    DashboardSidebar(),
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
