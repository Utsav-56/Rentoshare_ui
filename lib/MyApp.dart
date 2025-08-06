import 'package:flutter/material.dart';
import 'package:rentoshare/components/app_drawer.dart' show AppDrawer;
import 'package:rentoshare/components/bottom_navigation_bar.dart';

//  THis is a custom wrapper for my app which will wrap the drawer, bottom navigation bar and other presistent widgets
// Will use the getx obx for the state management
class RentoShareApp extends StatelessWidget {
  final Widget child;
  final String title;

  const RentoShareApp({
    super.key,
    required this.child,
    this.title = "RentoShare",
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: isWide ? null : const AppDrawer(),
      body: isWide
          ? Row(
              children: [
                const SizedBox(
                  width: 240,
                  child: AppDrawer(),
                ), // persistent drawer
                Expanded(child: child),
              ],
            )
          : child,
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
