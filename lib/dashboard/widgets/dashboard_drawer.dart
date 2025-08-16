import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/dashboard/controllers/dashboard_controller.dart';
import 'package:rentoshare/routes/app_routes.dart';

import '../../routes/app_router.dart' show AppRouter;

class DashboardDrawerItem {
  final String label;
  final IconData icon;
  final String? route;
  final VoidCallback? onTap;

  const DashboardDrawerItem({
    required this.label,
    required this.icon,
    this.route,
    this.onTap,
  });

  static const headItems = [
    DashboardDrawerItem(label: "Utsav", icon: Icons.account_circle),
  ];

  static const topItems = [
    DashboardDrawerItem(label: "Home", icon: Icons.home, route: AppRoutes.HOME),
    DashboardDrawerItem(
      label: "Profile",
      icon: Icons.person,
      route: AppRoutes.LOGIN,
    ),
    DashboardDrawerItem(
      label: "Settings",
      icon: Icons.settings,
      route: AppRoutes.SETTINGS,
    ),
  ];

  static const bottomItems = [
    DashboardDrawerItem(
      label: "Logout",
      icon: Icons.logout,
      route: AppRoutes.LOGIN,
    ),
  ];
}

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  void _handleItemTap(DashboardDrawerItem item) {
    if (item.onTap != null) {
      item.onTap!();
    } else if (item.route != null && item.route != Get.currentRoute) {
      AppRouter.to(item.route!);
    }
  }

  Widget _buildItem(DashboardDrawerItem item, {bool isHeader = false}) {
    return ListTile(
      leading: Icon(item.icon),
      title: Text(
        item.label,
        style: isHeader
            ? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            : const TextStyle(fontSize: 16),
      ),
      onTap: isHeader ? null : () => _handleItemTap(item),
    );
  }

  Widget get drawerContent => SafeArea(
    child: Column(
      children: [
        // Header
        Column(
          children: [
            // The drawer close button aligned to the right
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),

            // Header Items
            ...DashboardDrawerItem.headItems.map(
              (item) => _buildItem(item, isHeader: true),
            ),
          ],
        ),
        const Divider(),

        // Top Items
        Expanded(
          child: ListView(
            children: DashboardDrawerItem.topItems.map(_buildItem).toList(),
          ),
        ),

        const Divider(),

        // Bottom Items
        Column(
          children: DashboardDrawerItem.bottomItems.map(_buildItem).toList(),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(elevation: 4, child: drawerContent);
  }

  Widget get asSideBar => drawerContent;
}

class DashboardSidebar extends StatefulWidget {
  const DashboardSidebar({super.key});

  @override
  State<DashboardSidebar> createState() => _DashboardSidebarState();
}

class _DashboardSidebarState extends State<DashboardSidebar> {
  late DashboardNavController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DashboardNavController>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Container(
          width: controller.isIconOnlyMode.value ? 72.0 : 150.0,
          height: double.infinity,
          color: Theme.of(context).colorScheme.surfaceBright,
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: controller.toggleIconsOnlyMode,
                      icon: Icon(
                        controller.isIconOnlyMode.value
                            ? Icons.menu
                            : Icons.menu_open,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),

                    // Header Items
                    ...DashboardDrawerItem.headItems.map(
                      (item) => _buildItem(item, isHeader: true),
                    ),
                  ],
                ),
              ),
              const Divider(),

              // Top Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: DashboardDrawerItem.topItems
                      .map(_buildItem)
                      .toList(),
                ),
              ),

              const Divider(),

              // Bottom Items
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: DashboardDrawerItem.bottomItems
                      .map(_buildItem)
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleItemTap(DashboardDrawerItem item) {
    if (item.onTap != null) {
      item.onTap!();
    } else if (item.route != null && item.route != Get.currentRoute) {
      AppRouter.to(item.route!);
    }
  }

  Widget _buildItem(DashboardDrawerItem item, {bool isHeader = false}) {
    return Obx(() {
      if (controller.isIconOnlyMode.value) {
        return Tooltip(
          message: item.label,
          child: Container(
            width: 56,
            height: 56,
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: InkWell(
              onTap: isHeader ? null : () => _handleItemTap(item),
              borderRadius: BorderRadius.circular(8.0),
              child: Icon(
                item.icon,
                size: isHeader ? 28 : 24,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        );
      }

      return ListTile(
        leading: Icon(item.icon),
        title: Text(
          item.label,
          style: isHeader
              ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              : const TextStyle(fontSize: 14),
        ),
        onTap: isHeader ? null : () => _handleItemTap(item),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        dense: true,
      );
    });
  }
}
