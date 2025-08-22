import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/controllers/app_navigation_controller.dart';
import 'package:rentoshare/widget_items_models/drawer_items.dart';

import '../routes/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // Drawer styling constants
  static const double _drawerElevation = 4.0;
  static const double _headerPadding = 8.0;
  static const double _dividerHeight = 1.0;
  static const double _bottomPadding = 0.0;

  // Close button constants
  static const double _closeButtonSize = 24.0;
  static const EdgeInsets _closeButtonPadding = EdgeInsets.all(8.0);

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<AppNavigationController>();

    final drawerContent = SafeArea(
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(height: _dividerHeight),
          _buildTopItems(navController),
          const Divider(height: _dividerHeight),
          _buildBottomItems(navController),
        ],
      ),
    );

    return Drawer(
      elevation: _drawerElevation,
      backgroundColor: Colors.grey.shade900,
      child: drawerContent,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        // Close button aligned to the right
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.close, size: _closeButtonSize),
              padding: _closeButtonPadding,
              onPressed: () => Get.back(),
            ),
          ],
        ),
        // Header Items
        ...DrawerItems.headItems.map(
          (item) =>
              _AppDrawerItem(item: item, onTap: () => _handleItemTap(item)),
        ),
      ],
    );
  }

  Widget _buildTopItems(AppNavigationController navController) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: _headerPadding),
        itemCount: DrawerItems.topItems.length,
        itemBuilder: (context, index) {
          final item = DrawerItems.topItems[index];
          return Obx(
            () => _AppDrawerItem(
              item: item,
              isActive: _isItemActive(item, navController.currentRoute.value),
              onTap: () => _handleItemTap(item),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomItems(AppNavigationController navController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _bottomPadding),
      child: Column(
        children: DrawerItems.bottomItems.map((item) {
          return Obx(
            () => _AppDrawerItem(
              item: item,
              isActive: _isItemActive(item, navController.currentRoute.value),
              onTap: () => _handleItemTap(item),
            ),
          );
        }).toList(),
      ),
    );
  }

  bool _isItemActive(DrawerItem item, String currentRoute) {
    return item.isActive(currentRoute);
  }

  void _handleItemTap(DrawerItem item) {
    // Close drawer first
    Get.back();

    if (item.onTap != null) {
      item.onTap!();
    } else if (item.route != null && !AppRouter.isActiveRoute(item.route!)) {
      AppRouter.to(item.route!);
    }
  }
}

class _AppDrawerItem extends StatelessWidget {
  final DrawerItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _AppDrawerItem({
    required this.item,
    required this.onTap,
    this.isActive = false,
  });

  // Item styling constants
  static const double _headerFontSize = 24.0;
  static const double _itemFontSize = 16.0;
  static const FontWeight _headerFontWeight = FontWeight.bold;
  static const FontWeight _itemFontWeight = FontWeight.normal;
  static const double _iconSize = 24.0;
  static const double _headerIconSize = 28.0;
  static const EdgeInsets _itemPadding = EdgeInsets.symmetric(
    horizontal: 8.0,
    vertical: 3.0,
  );
  static const double _borderRadius = 8.0;
  static const double _activeOpacity = 0.12;

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<AppNavigationController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 0, 0, 0)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: ListTile(
        leading: Icon(
          item.icon,
          size: item.isHeader ? _headerIconSize : _iconSize,
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(
          item.label,
          style: TextStyle(
            fontSize: item.isHeader ? _headerFontSize : _itemFontSize,
            fontWeight: item.isHeader ? _headerFontWeight : _itemFontWeight,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: item.isHeader ? null : onTap,
        contentPadding: _itemPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
    );
  }
}
