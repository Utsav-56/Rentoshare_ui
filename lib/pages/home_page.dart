import 'package:flutter/material.dart';
import 'package:rentoshare/app_utils/notifier.dart';
import 'package:rentoshare/components/app_drawer.dart';
import 'package:rentoshare/components/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Drawer")),
      drawer: isWide ? null : const AppDrawer(),
      body: Row(
        children: [
          if (isWide)
            const SizedBox(width: 240, child: AppDrawer()), // persistent drawer
          const Expanded(child: Center(child: Text("Main content here"))),
        ],
      ),
    );
  }
}
