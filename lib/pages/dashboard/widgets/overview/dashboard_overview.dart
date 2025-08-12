import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:rentoshare/pages/dashboard/widgets/overview/welcome_section.dart';
import 'package:rentoshare/pages/dashboard/widgets/overview/stats_cards.dart';
import 'package:rentoshare/pages/dashboard/widgets/overview/recent_activity.dart';
import 'package:rentoshare/pages/dashboard/widgets/overview/messages_preview.dart';
import 'package:rentoshare/pages/dashboard/widgets/overview/earnings_chart.dart';
import 'package:rentoshare/pages/dashboard/widgets/overview/recommended_section.dart';
import 'package:rentoshare/pages/dashboard/widgets/overview/support_tips.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshData();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome & Quick Actions
            const WelcomeSection(),
            SizedBox(height: 24.h),

            // Stats Overview Cards
            const StatsCards(),
            SizedBox(height: 24.h),

            // Recent Activity & Messages Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recent Activity (60% width)
                Expanded(flex: 3, child: const RecentActivity()),
                SizedBox(width: 16.w),

                // Messages Preview (40% width)
                Expanded(flex: 2, child: const MessagesPreview()),
              ],
            ),
            SizedBox(height: 24.h),

            // Earnings Chart
            const EarningsChart(),
            SizedBox(height: 24.h),

            // Recommended Listings
            const RecommendedSection(),
            SizedBox(height: 24.h),

            // Support & Tips
            const SupportTips(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
