import 'package:flutter/material.dart';

import 'package:rentoshare/components/app_drawer.dart' show AppDrawer;
import 'package:rentoshare/components/app_sidebar.dart';
import 'package:rentoshare/components/bottom_navigation_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > _tabletBreakpoint;
    final shouldShowDrawer = (showDrawer ?? true) && !isWide;
    final pageTitle = title ?? 'RentoShare';

    final normalLayout = Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      drawer: const AppDrawer(),
      body: ClipRect(child: child),
      bottomNavigationBar: (showBottomNav ?? true) ? AppBottomBar() : null,
    );

    if (!shouldShowDrawer) {
      return Scaffold(body: Row(children: [AppSidebar(), normalLayout]));
    } else {
      // Mobile layout with drawer
      return normalLayout;
    }
  }
}
