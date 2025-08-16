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
  static const double _bottomPadding = 8.0;

  // Close button constants
  static const double _closeButtonSize = 24.0;
  static const EdgeInsets _closeButtonPadding = EdgeInsets.all(8.0);

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>();
    final isWide = MediaQuery.of(context).size.width > 600;

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

    return isWide
        ? Drawer(elevation: 0, child: drawerContent)
        : Drawer(elevation: _drawerElevation, child: drawerContent);
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

  Widget _buildTopItems(NavigationController navController) {
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

  Widget _buildBottomItems(NavigationController navController) {
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
    horizontal: 16.0,
    vertical: 12.0,
  );
  static const double _borderRadius = 8.0;
  static const double _activeOpacity = 0.12;

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary.withOpacity(_activeOpacity)
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

// App Sidebar for desktop/tablet
class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  // Sidebar styling constants
  static const double _iconOnlyWidth = 72.0;
  static const double _expandedWidth = 200.0;
  static const double _headerPadding = 8.0;
  static const double _dividerHeight = 1.0;
  static const double _bottomPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>();

    return SafeArea(
      child: Obx(
        () => Container(
          width: navController.sidebarWidth,
          height: double.infinity,
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Column(
            children: [
              _buildHeader(context, navController),
              const Divider(height: _dividerHeight),
              _buildTopItems(navController),
              const Divider(height: _dividerHeight),
              _buildBottomItems(navController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    NavigationController navController,
  ) {
    return Container(
      padding: const EdgeInsets.all(_headerPadding),
      child: Column(
        children: [
          IconButton(
            onPressed: navController.toggleIconsOnlyMode,
            icon: Obx(
              () => Icon(
                navController.isIconOnlyMode.value
                    ? Icons.menu
                    : Icons.menu_open,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          // Header Items
          ...DrawerItems.headItems.map(
            (item) => _SidebarItem(item: item, isActive: false, onTap: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildTopItems(NavigationController navController) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: DrawerItems.topItems.length,
        itemBuilder: (context, index) {
          final item = DrawerItems.topItems[index];
          return Obx(
            () => _SidebarItem(
              item: item,
              isActive: _isItemActive(item, navController.currentRoute.value),
              onTap: () => _handleItemTap(item),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomItems(NavigationController navController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _bottomPadding),
      child: Column(
        children: DrawerItems.bottomItems.map((item) {
          return Obx(
            () => _SidebarItem(
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
    if (item.onTap != null) {
      item.onTap!();
    } else if (item.route != null && !AppRouter.isActiveRoute(item.route!)) {
      AppRouter.to(item.route!);
    }
  }
}

class _SidebarItem extends StatelessWidget {
  final DrawerItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  // Item styling constants
  static const double _iconOnlySize = 56.0;
  static const double _iconSize = 24.0;
  static const double _headerIconSize = 28.0;
  static const double _headerFontSize = 18.0;
  static const double _itemFontSize = 14.0;
  static const FontWeight _headerFontWeight = FontWeight.bold;
  static const FontWeight _itemFontWeight = FontWeight.normal;
  static const EdgeInsets _iconOnlyMargin = EdgeInsets.symmetric(
    vertical: 4.0,
    horizontal: 8.0,
  );
  static const EdgeInsets _itemPadding = EdgeInsets.symmetric(horizontal: 16.0);
  static const double _borderRadius = 8.0;
  static const double _activeOpacity = 0.12;
  static const double _tooltipDelay = 500.0;

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>();

    return Obx(() {
      if (navController.isIconOnlyMode.value) {
        return _buildIconOnlyItem(context);
      }
      return _buildFullItem(context);
    });
  }

  Widget _buildIconOnlyItem(BuildContext context) {
    return Tooltip(
      message: item.label,
      waitDuration: Duration(milliseconds: _tooltipDelay.toInt()),
      child: Container(
        width: _iconOnlySize,
        height: _iconOnlySize,
        margin: _iconOnlyMargin,
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(_activeOpacity)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: InkWell(
          onTap: item.isHeader ? null : onTap,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Icon(
            item.icon,
            size: item.isHeader ? _headerIconSize : _iconSize,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildFullItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary.withOpacity(_activeOpacity)
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
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
    );
  }
}
