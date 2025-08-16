import 'package:flutter/material.dart';
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

    // Use MediaQuery for breakpoints
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final double maxContentWidth = isMobile ? double.infinity : 700.0;
    final EdgeInsets contentPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 24);

    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshData();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Container(
            width: maxContentWidth,
            padding: contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome & Quick Actions
                const WelcomeSection(),
                const SizedBox(height: 18),

                // Stats Overview Cards
                const StatsCards(),
                const SizedBox(height: 18),

                // Recent Activity & Messages
                if (isMobile) ...[
                  const RecentActivity(),
                  const SizedBox(height: 18),
                  const MessagesPreview(),
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recent Activity (60% width)
                      Expanded(flex: 3, child: const RecentActivity()),
                      const SizedBox(width: 18),
                      // Messages Preview (40% width)
                      Expanded(flex: 2, child: const MessagesPreview()),
                    ],
                  ),
                const SizedBox(height: 18),

                // Earnings Chart
                const EarningsChart(),
                const SizedBox(height: 18),

                // Recommended Listings
                const RecommendedSection(),
                const SizedBox(height: 18),

                // Support & Tips
                const SupportTips(),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
