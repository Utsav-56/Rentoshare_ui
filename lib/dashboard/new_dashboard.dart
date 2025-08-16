import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class NewDashboard extends StatelessWidget {
  const NewDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [DashboardWelcomeSection()]),
        ),
      ),
    );
  }
}

class DashboardWelcomeSection extends StatelessWidget {
  DashboardWelcomeSection({super.key});

  double getScreenWidth() {
    return Get.width;
  }

  double getScreenHeight() {
    return Get.height;
  }

  double getScreenSize() {
    return getScreenWidth() * getScreenHeight();
  }

  double sizedBoxHeight = 12;
  double sizedBoxWidth = 12;

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_sunny_rounded,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 28.w,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Obx(
                  () => Text(
                    'Welcome back, ${controller.userName.value.split(' ').first}! 👋',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Ready to manage your rentals and earn more today?',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 20.h),

          // Quick Action Buttons
          Row(
            children: [
              Expanded(
                child: _QuickActionButton(
                  icon: Icons.add_rounded,
                  label: 'Post Service',
                  onTap: () {
                    // Navigate to post service
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _QuickActionButton(
                  icon: Icons.list_alt_rounded,
                  label: 'My Listings',
                  onTap: () {
                    controller.selectMenuItem(1);
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _QuickActionButton(
                  icon: Icons.explore_rounded,
                  label: 'Browse',
                  onTap: () {
                    // Navigate to marketplace
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 24.w,
              ),
              SizedBox(height: 8.h),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
