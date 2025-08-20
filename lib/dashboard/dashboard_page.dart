import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/controllers/app_navigation_controller.dart';
import 'package:rentoshare/dashboard/controllers/dashboard_controller.dart';
import 'package:rentoshare/dashboard/widgets/dashboard_app_bar.dart';
import 'package:rentoshare/components/app_drawer.dart';
import 'package:rentoshare/dashboard/widgets/dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // Layout constants
  static const double _tabletBreakpoint = 600.0;

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());
    final navController = Get.find<AppNavigationController>();

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
                    // Dashboard-specific sidebar
                    Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: navController.sidebarWidth,
                        child: Container(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          child: _buildDashboardSidebar(navController),
                        ),
                      ),
                    ),
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

  Widget _buildDashboardSidebar(AppNavigationController navController) {
    final dashboardController = Get.find<DashboardController>();

    return Obx(() {
      if (navController.isIconOnlyMode.value) {
        return _buildIconOnlySidebar(dashboardController, navController);
      }
      return _buildFullSidebar(dashboardController, navController);
    });
  }

  Widget _buildIconOnlySidebar(
    DashboardController dashboardController,
    AppNavigationController navController,
  ) {
    return SafeArea(
      child: Column(
        children: [
          // Toggle button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: navController.toggleIconsOnlyMode,
              icon: const Icon(Icons.menu),
              tooltip: 'Expand sidebar',
            ),
          ),
          const Divider(),
          // Menu items
          Expanded(
            child: ListView.builder(
              itemCount: dashboardController.menuItems.length,
              itemBuilder: (context, index) {
                final item = dashboardController.menuItems[index];
                final isActive =
                    dashboardController.selectedMenuIndex.value == index;

                return Tooltip(
                  message: item.title,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: navController.getItemBackgroundColor(
                        context,
                        isActive,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () =>
                          dashboardController.selectMenuItem(index),
                      icon: Icon(
                        _getIconFromString(item.icon),
                        color: navController.getItemIconColor(
                          context,
                          isActive,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullSidebar(
    DashboardController dashboardController,
    AppNavigationController navController,
  ) {
    return SafeArea(
      child: Column(
        children: [
          // Header with toggle
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: navController.toggleIconsOnlyMode,
                  icon: const Icon(Icons.chevron_left),
                  tooltip: 'Collapse sidebar',
                ),
              ],
            ),
          ),
          const Divider(),
          // Menu items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: dashboardController.menuItems.length,
              itemBuilder: (context, index) {
                final item = dashboardController.menuItems[index];
                final isActive =
                    dashboardController.selectedMenuIndex.value == index;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    color: navController.getItemBackgroundColor(
                      context,
                      isActive,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Icon(
                      _getIconFromString(item.icon),
                      color: navController.getItemIconColor(context, isActive),
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: navController.getItemTextColor(
                          context,
                          isActive,
                        ),
                      ),
                    ),
                    onTap: () => dashboardController.selectMenuItem(index),
                    dense: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconFromString(String iconName) {
    switch (iconName) {
      case 'home':
        return Icons.home_rounded;
      case 'list':
        return Icons.list_alt_rounded;
      case 'shopping_bag':
        return Icons.shopping_bag_rounded;
      case 'message':
        return Icons.message_rounded;
      case 'star':
        return Icons.star_rounded;
      case 'account_balance_wallet':
        return Icons.account_balance_wallet_rounded;
      case 'settings':
        return Icons.settings_rounded;
      default:
        return Icons.circle;
    }
  }
}
