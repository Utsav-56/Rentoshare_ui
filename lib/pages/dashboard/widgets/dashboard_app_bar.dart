import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    final navController = Get.find<DashboardNavController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          leading: navController.getLeadingIcon(context),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildWelcomeMessage(dashboardController, context)],
          ),
          actions: _buildActions(context, dashboardController),
        );
      },
    );
  }

  Obx _buildWelcomeMessage(
    DashboardController controller,
    BuildContext context,
  ) {
    return Obx(
      () => Text(
        'Welcome back, ${controller.userName.value.split(' ').first}',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        ),
      ),
    );
  }

  List<Widget> _buildActions(
    BuildContext context,
    DashboardController controller,
  ) {
    return [
      // Notifications
      Container(
        margin: EdgeInsets.only(right: 8.w),
        child: Stack(
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: Theme.of(context).colorScheme.onSurface,
                size: 24.w,
              ),
              onPressed: () {
                // Handle notifications
              },
            ),
            Positioned(
              right: 8.w,
              top: 8.h,
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),

      // Profile Avatar
      Container(
        margin: EdgeInsets.only(right: 16.w),
        child: GestureDetector(
          onTap: () {
            // Handle profile tap
          },
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Obx(
              () => Text(
                controller.userName.value.split(' ').map((e) => e[0]).join(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
