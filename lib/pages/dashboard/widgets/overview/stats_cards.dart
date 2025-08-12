import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 16.h),

        // First Row - Active Listings & Pending Requests
        Row(
          children: [
            Expanded(
              child: Obx(
                () => _StatCard(
                  title: 'Active Listings',
                  value: controller.activeListings.value.toString(),
                  icon: Icons.list_alt_rounded,
                  iconColor: const Color(0xFF10B981),
                  onTap: () => controller.selectMenuItem(1),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Obx(
                () => _StatCard(
                  title: 'Pending Requests',
                  value: controller.pendingRequests.value.toString(),
                  icon: Icons.access_time_rounded,
                  iconColor: const Color(0xFFF59E0B),
                  badge: controller.pendingRequests.value > 0
                      ? controller.pendingRequests.value
                      : null,
                  onTap: () => controller.selectMenuItem(3),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Second Row - Active Rentals & Wallet Balance
        Row(
          children: [
            Expanded(
              child: Obx(
                () => _StatCard(
                  title: 'Active Rentals',
                  value: controller.activeRentals.value.toString(),
                  icon: Icons.shopping_bag_rounded,
                  iconColor: const Color(0xFF8B5CF6),
                  onTap: () => controller.selectMenuItem(2),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Obx(
                () => _StatCard(
                  title: 'Wallet Balance',
                  value:
                      '\$${controller.walletBalance.value.toStringAsFixed(2)}',
                  icon: Icons.account_balance_wallet_rounded,
                  iconColor: const Color(0xFF06B6D4),
                  onTap: () => controller.selectMenuItem(5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final int? badge;
  final VoidCallback? onTap;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.badge,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                blurRadius: 10.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(icon, color: iconColor, size: 20.w),
                  ),
                  if (badge != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        badge.toString(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onError,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
