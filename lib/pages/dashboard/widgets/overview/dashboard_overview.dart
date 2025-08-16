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

  // Breakpoint constants
  static const double _mobileBreakpoint = 600.0;

  // Layout constants
  static const double _maxContentWidthDesktop = 700.0;
  static const double _infiniteWidth = double.infinity;

  // Padding constants
  static const double _mobilePaddingHorizontal = 12.0;
  static const double _mobilePaddingVertical = 12.0;
  static const double _desktopPaddingHorizontal = 24.0;
  static const double _desktopPaddingVertical = 24.0;

  static const EdgeInsets _mobilePadding = EdgeInsets.symmetric(
    horizontal: _mobilePaddingHorizontal,
    vertical: _mobilePaddingVertical,
  );

  static const EdgeInsets _desktopPadding = EdgeInsets.symmetric(
    horizontal: _desktopPaddingHorizontal,
    vertical: _desktopPaddingVertical,
  );

  // Spacing constants
  static const double _sectionSpacing = 18.0;
  static const double _horizontalSpacing = 18.0;

  // Flex proportions for desktop layout
  static const int _recentActivityFlex = 3;
  static const int _messagesPreviewFlex = 2;

  // Widget alignment constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;
  static const CrossAxisAlignment _rowCrossAxisAlignment =
      CrossAxisAlignment.start;

  // Scroll physics
  static const ScrollPhysics _scrollPhysics = AlwaysScrollableScrollPhysics();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final responsiveValues = _calculateResponsiveValues(context);

    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshData();
      },
      child: SingleChildScrollView(
        physics: _scrollPhysics,
        child: Center(
          child: Container(
            width: responsiveValues.maxContentWidth,
            padding: responsiveValues.contentPadding,
            child: Column(
              crossAxisAlignment: _columnCrossAxisAlignment,
              children: _buildDashboardSections(responsiveValues.isMobile),
            ),
          ),
        ),
      ),
    );
  }

  _ResponsiveValues _calculateResponsiveValues(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < _mobileBreakpoint;

    return _ResponsiveValues(
      isMobile: isMobile,
      maxContentWidth: isMobile ? _infiniteWidth : _maxContentWidthDesktop,
      contentPadding: isMobile ? _mobilePadding : _desktopPadding,
    );
  }

  List<Widget> _buildDashboardSections(bool isMobile) {
    return [
      // Welcome & Quick Actions
      _buildWelcomeSection(),
      _buildSectionSpacer(),

      // Stats Overview Cards
      _buildStatsCards(),
      _buildSectionSpacer(),

      // Recent Activity & Messages (responsive layout)
      _buildActivityAndMessagesSection(isMobile),
      _buildSectionSpacer(),

      // Earnings Chart
      _buildEarningsChart(),
      _buildSectionSpacer(),

      // Recommended Listings
      _buildRecommendedSection(),
      _buildSectionSpacer(),

      // Support & Tips
      _buildSupportTips(),
      _buildBottomSpacer(),
    ];
  }

  Widget _buildWelcomeSection() => const WelcomeSection();

  Widget _buildStatsCards() => const StatsCards();

  Widget _buildSectionSpacer() => const SizedBox(height: _sectionSpacing);

  Widget _buildBottomSpacer() => const SizedBox(height: _sectionSpacing);

  Widget _buildHorizontalSpacer() => const SizedBox(width: _horizontalSpacing);

  Widget _buildEarningsChart() => const EarningsChart();

  Widget _buildRecommendedSection() => const RecommendedSection();

  Widget _buildSupportTips() => const SupportTips();

  Widget _buildActivityAndMessagesSection(bool isMobile) {
    // if (isMobile) {
    //   return _buildMobileActivityAndMessages();
    // } else {
    //   return _buildDesktopActivityAndMessages();
    // }
    // Currently only mobile layout
    return _buildMobileActivityAndMessages();
  }

  Widget _buildMobileActivityAndMessages() {
    return Column(
      crossAxisAlignment: _columnCrossAxisAlignment,
      children: [
        _buildRecentActivity(),
        _buildSectionSpacer(),
        _buildMessagesPreview(),
      ],
    );
  }

  Widget _buildDesktopActivityAndMessages() {
    return Row(
      crossAxisAlignment: _rowCrossAxisAlignment,
      children: [
        // Recent Activity (60% width)
        Expanded(flex: _recentActivityFlex, child: _buildRecentActivity()),
        _buildHorizontalSpacer(),
        // Messages Preview (40% width)
        Expanded(flex: _messagesPreviewFlex, child: _buildMessagesPreview()),
      ],
    );
  }

  Widget _buildRecentActivity() => const RecentActivity();

  Widget _buildMessagesPreview() => const MessagesPreview();
}

// Helper class to store responsive values
class _ResponsiveValues {
  final bool isMobile;
  final double maxContentWidth;
  final EdgeInsets contentPadding;

  const _ResponsiveValues({
    required this.isMobile,
    required this.maxContentWidth,
    required this.contentPadding,
  });
}
