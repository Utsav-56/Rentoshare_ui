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

class _DashboardSidebarState extends State<DashboardSidebar>
    with SingleTickerProviderStateMixin {
  late DashboardNavController controller;
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  // Constants for sidebar dimensions
  static const double _iconOnlyWidth = 72.0;
  static const double _expandedWidth =
      200.0; // Increased from 150.0 for better spacing
  static const Duration _animationDuration = Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    controller = Get.find<DashboardNavController>();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    // Create width animation
    _widthAnimation =
        Tween<double>(
          begin: controller.isIconOnlyMode.value
              ? _iconOnlyWidth
              : _expandedWidth,
          end: controller.isIconOnlyMode.value
              ? _iconOnlyWidth
              : _expandedWidth,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    // Listen to controller changes
    ever(controller.isIconOnlyMode, (bool isIconOnly) {
      _updateWidth(isIconOnly);
    });
  }

  void _updateWidth(bool isIconOnly) {
    _widthAnimation =
        Tween<double>(
          begin: _widthAnimation.value,
          end: isIconOnly ? _iconOnlyWidth : _expandedWidth,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: _widthAnimation,
        builder: (context, child) {
          return Container(
            width: _widthAnimation.value,
            height: double.infinity,
            color: Theme.of(context).colorScheme.surfaceBright,
            child: Column(
              children: [
                _buildHeader(context),
                const Divider(height: 1),
                _buildTopItems(),
                const Divider(height: 1),
                _buildBottomItems(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: controller.toggleIconsOnlyMode,
            icon: Obx(
              () => Icon(
                controller.isIconOnlyMode.value ? Icons.menu : Icons.menu_open,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          // Header Items
          ...DashboardDrawerItem.headItems.map(
            (item) => _buildItem(item, isHeader: true),
          ),
        ],
      ),
    );
  }

  Widget _buildTopItems() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: DashboardDrawerItem.topItems.length,
        itemBuilder: (context, index) {
          final item = DashboardDrawerItem.topItems[index];
          return _buildItem(item);
        },
      ),
    );
  }

  Widget _buildBottomItems() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: DashboardDrawerItem.bottomItems
            .map((item) => _buildItem(item))
            .toList(),
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
      final isIconOnly = controller.isIconOnlyMode.value;

      if (isIconOnly) {
        return _buildIconOnlyItem(item, isHeader);
      } else {
        return _buildFullItem(item, isHeader);
      }
    });
  }

  Widget _buildIconOnlyItem(DashboardDrawerItem item, bool isHeader) {
    return Tooltip(
      message: item.label,
      waitDuration: const Duration(milliseconds: 500),
      child: Container(
        width: 56,
        height: 56,
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
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

  Widget _buildFullItem(DashboardDrawerItem item, bool isHeader) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: ListTile(
        leading: Icon(
          item.icon,
          size: isHeader ? 28 : 24,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(
          item.label,
          style: TextStyle(
            fontSize: isHeader ? 18 : 14,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        onTap: isHeader ? null : () => _handleItemTap(item),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
