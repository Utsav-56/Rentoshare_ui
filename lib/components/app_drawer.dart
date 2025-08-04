import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/widget_items_models/drawer_items.dart';
import '../routes/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _handleItemTap(DrawerItem item) {
    if (item.onTap != null) {
      item.onTap!();
    } else if (item.route != null && item.route != Get.currentRoute) {
      AppRouter.to(item.route!);
    }
  }

  Widget _buildItem(DrawerItem item, {bool isHeader = false}) {
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

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    final drawerContent = SafeArea(
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
              ...DrawerItems.headItems.map(
                (item) => _buildItem(item, isHeader: true),
              ),
            ],
          ),
          const Divider(),

          // Top Items
          Expanded(
            child: ListView(
              children: DrawerItems.topItems.map(_buildItem).toList(),
            ),
          ),

          const Divider(),

          // Bottom Items
          Column(children: DrawerItems.bottomItems.map(_buildItem).toList()),
        ],
      ),
    );

    // Return a responsive drawer (temporary or permanent)
    return isWide
        ? Drawer(elevation: 0, child: drawerContent)
        : Drawer(child: drawerContent);
  }
}
