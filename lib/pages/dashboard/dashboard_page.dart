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
    final controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const DashboardAppBar(),
      drawer: const DashboardDrawer(),
      body: Obx(
        () =>
            DashboardContent(selectedIndex: controller.selectedMenuIndex.value),
      ),
    );
  }
}
