import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  // Layout constants
  static final double _sectionTitleFontSize = 18;
  static final double _titleBottomSpacing = 16;
  static final double _rowSpacing = 16;
  static final double _cardSpacing = 16;

  // Text styling constants
  static const FontWeight _sectionTitleFontWeight = FontWeight.w700;
  static const CrossAxisAlignment _columnAlignment = CrossAxisAlignment.start;

  // Content constants
  static const String _sectionTitle = 'Overview';

  // Stat card data configuration
  static const List<Map<String, dynamic>> _statCardConfigs = [
    {
      'key': 'activeListings',
      'title': 'Active Listings',
      'icon': Icons.list_alt_rounded,
      'iconColor': Color(0xFF10B981),
      'menuIndex': 1,
    },
    {
      'key': 'pendingRequests',
      'title': 'Pending Requests',
      'icon': Icons.access_time_rounded,
      'iconColor': Color(0xFFF59E0B),
      'menuIndex': 3,
      'showBadge': true,
    },
    {
      'key': 'activeRentals',
      'title': 'Active Rentals',
      'icon': Icons.shopping_bag_rounded,
      'iconColor': Color(0xFF8B5CF6),
      'menuIndex': 2,
    },
    {
      'key': 'walletBalance',
      'title': 'Wallet Balance',
      'icon': Icons.account_balance_wallet_rounded,
      'iconColor': Color(0xFF06B6D4),
      'menuIndex': 5,
      'isWallet': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Column(
      crossAxisAlignment: _columnAlignment,
      children: [
        _buildSectionTitle(context),
        SizedBox(height: _titleBottomSpacing),
        _buildStatsGrid(controller),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      _sectionTitle,
      style: TextStyle(
        fontSize: _sectionTitleFontSize,
        fontWeight: _sectionTitleFontWeight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildStatsGrid(DashboardController controller) {
    final firstRowConfigs = _statCardConfigs.take(2).toList();
    final secondRowConfigs = _statCardConfigs.skip(2).take(2).toList();

    return Column(
      children: [
        _buildStatsRow(controller, firstRowConfigs),
        SizedBox(height: _rowSpacing),
        _buildStatsRow(controller, secondRowConfigs),
      ],
    );
  }

  Widget _buildStatsRow(
    DashboardController controller,
    List<Map<String, dynamic>> configs,
  ) {
    return Row(
      children: [
        Expanded(child: _buildStatCard(controller, configs[0])),
        SizedBox(width: _cardSpacing),
        Expanded(child: _buildStatCard(controller, configs[1])),
      ],
    );
  }

  Widget _buildStatCard(
    DashboardController controller,
    Map<String, dynamic> config,
  ) {
    return Obx(
      () => _StatCard(
        title: config['title'],
        value: _getCardValue(controller, config),
        icon: config['icon'],
        iconColor: config['iconColor'],
        badge: _getCardBadge(controller, config),
        onTap: () => controller.selectMenuItem(config['menuIndex']),
      ),
    );
  }

  String _getCardValue(
    DashboardController controller,
    Map<String, dynamic> config,
  ) {
    final key = config['key'];
    final isWallet = config['isWallet'] ?? false;

    switch (key) {
      case 'activeListings':
        return controller.activeListings.value.toString();
      case 'pendingRequests':
        return controller.pendingRequests.value.toString();
      case 'activeRentals':
        return controller.activeRentals.value.toString();
      case 'walletBalance':
        return isWallet
            ? '\$${controller.walletBalance.value.toStringAsFixed(2)}'
            : controller.walletBalance.value.toString();
      default:
        return '0';
    }
  }

  int? _getCardBadge(
    DashboardController controller,
    Map<String, dynamic> config,
  ) {
    final showBadge = config['showBadge'] ?? false;
    if (!showBadge) return null;

    final key = config['key'];
    switch (key) {
      case 'pendingRequests':
        return controller.pendingRequests.value > 0
            ? controller.pendingRequests.value
            : null;
      default:
        return null;
    }
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

  // Card layout constants
  static final double _cardPadding = 20;
  static final double _cardBorderRadius = 16;
  static final double _cardBorderWidth = 1.0;
  static const double _cardBorderOpacity = 0.1;
  static const double _cardShadowOpacity = 0.05;
  static final double _cardShadowBlur = 10.r;
  static final Offset _cardShadowOffset = Offset(0, 2);

  // Icon container constants
  static final double _iconContainerPadding = 8;
  static final double _iconContainerBorderRadius = 8;
  static final double _iconSize = 20;
  static const double _iconBackgroundOpacity = 0.1;

  // Badge constants
  static final double _badgeHorizontalPadding = 8;
  static final double _badgeVerticalPadding = 4;
  static final double _badgeBorderRadius = 12;
  static final double _badgeFontSize = 10;
  static const FontWeight _badgeFontWeight = FontWeight.w600;

  // Text styling constants
  static final double _valueFontSize = 24;
  static const FontWeight _valueFontWeight = FontWeight.w700;
  static final double _titleFontSize = 14;
  static const FontWeight _titleFontWeight = FontWeight.w500;
  static const double _titleOpacity = 0.7;

  // Spacing constants
  static final double _iconValueSpacing = 16;
  static final double _valueTitleSpacing = 4;

  // Layout constants
  static const CrossAxisAlignment _columnAlignment = CrossAxisAlignment.start;
  static const MainAxisAlignment _rowAlignment = MainAxisAlignment.spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_cardBorderRadius),
        child: Container(
          padding: EdgeInsets.all(_cardPadding),
          decoration: _buildCardDecoration(context),
          child: Column(
            crossAxisAlignment: _columnAlignment,
            children: [
              _buildCardHeader(context),
              SizedBox(height: _iconValueSpacing),
              _buildCardValue(context),
              SizedBox(height: _valueTitleSpacing),
              _buildCardTitle(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(_cardBorderRadius),
      border: Border.all(
        color: Theme.of(
          context,
        ).colorScheme.outline.withOpacity(_cardBorderOpacity),
        width: _cardBorderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(
            context,
          ).colorScheme.shadow.withOpacity(_cardShadowOpacity),
          blurRadius: _cardShadowBlur,
          offset: _cardShadowOffset,
        ),
      ],
    );
  }

  Widget _buildCardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: _rowAlignment,
      children: [
        _buildIconContainer(),
        if (badge != null) _buildBadge(context),
      ],
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: EdgeInsets.all(_iconContainerPadding),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(_iconBackgroundOpacity),
        borderRadius: BorderRadius.circular(_iconContainerBorderRadius),
      ),
      child: Icon(icon, color: iconColor, size: _iconSize),
    );
  }

  Widget _buildBadge(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _badgeHorizontalPadding,
        vertical: _badgeVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(_badgeBorderRadius),
      ),
      child: Text(
        badge.toString(),
        style: TextStyle(
          fontSize: _badgeFontSize,
          fontWeight: _badgeFontWeight,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
    );
  }

  Widget _buildCardValue(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: _valueFontSize,
        fontWeight: _valueFontWeight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildCardTitle(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: _titleFontSize,
        fontWeight: _titleFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_titleOpacity),
      ),
    );
  }
}
