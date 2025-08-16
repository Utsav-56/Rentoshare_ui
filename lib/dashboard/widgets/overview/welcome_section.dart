import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/dashboard/controllers/dashboard_controller.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  // Layout constants
  static final double _containerPadding = 20.w;
  static final double _borderRadius = 16.r;
  static final double _shadowBlurRadius = 10.r;
  static final Offset _shadowOffset = Offset(0, 4.h);
  static const double _shadowOpacity = 0.1;
  static const double _gradientEndOpacity = 0.8;

  // Spacing constants
  static final double _iconTextSpacing = 12.w;
  static final double _titleSubtitleSpacing = 8.h;
  static final double _sectionSpacing = 20.h;
  static final double _buttonSpacing = 12.w;

  // Icon and text sizing
  static final double _sunIconSize = 28.w;
  static final double _titleFontSize = 20.sp;
  static final double _subtitleFontSize = 14;
  static const FontWeight _titleFontWeight = FontWeight.w700;
  static const FontWeight _subtitleFontWeight = FontWeight.w400;
  static const double _subtitleOpacity = 0.8;

  // Text content
  static const String _greetingEmoji = '👋';
  static const String _subtitleText =
      'Ready to manage your rentals and earn more today?';

  // Quick action button data
  static const List<Map<String, dynamic>> _quickActionData = [
    {
      'icon': Icons.add_rounded,
      'label': 'Post Service',
      'action': 'post_service',
    },
    {
      'icon': Icons.list_alt_rounded,
      'label': 'My Listings',
      'action': 'my_listings',
    },
    {'icon': Icons.explore_rounded, 'label': 'Browse', 'action': 'browse'},
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(_containerPadding),
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderRow(context, controller),
          SizedBox(height: _titleSubtitleSpacing),
          _buildSubtitle(context),
          SizedBox(height: _sectionSpacing),
          _buildQuickActionButtons(controller),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Theme.of(context).colorScheme.primaryContainer,
          Theme.of(
            context,
          ).colorScheme.primaryContainer.withOpacity(_gradientEndOpacity),
        ],
      ),
      borderRadius: BorderRadius.circular(_borderRadius),
      boxShadow: [
        BoxShadow(
          color: Theme.of(
            context,
          ).colorScheme.shadow.withOpacity(_shadowOpacity),
          blurRadius: _shadowBlurRadius,
          offset: _shadowOffset,
        ),
      ],
    );
  }

  Widget _buildHeaderRow(BuildContext context, DashboardController controller) {
    return Row(
      children: [
        Icon(
          Icons.wb_sunny_rounded,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          size: _sunIconSize,
        ),
        SizedBox(width: _iconTextSpacing),
        Expanded(
          child: Obx(
            () => Text(
              _buildGreetingText(controller.userName.value),
              style: _buildTitleStyle(context),
            ),
          ),
        ),
      ],
    );
  }

  String _buildGreetingText(String fullName) {
    final firstName = fullName.split(' ').first;
    return 'Welcome back, $firstName! $_greetingEmoji';
  }

  TextStyle _buildTitleStyle(BuildContext context) {
    return TextStyle(
      fontSize: _titleFontSize,
      fontWeight: _titleFontWeight,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      _subtitleText,
      style: TextStyle(
        fontSize: _subtitleFontSize,
        fontWeight: _subtitleFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onPrimaryContainer.withOpacity(_subtitleOpacity),
      ),
    );
  }

  Widget _buildQuickActionButtons(DashboardController controller) {
    return Row(
      children: _quickActionData.map((actionData) {
        final isLast = _quickActionData.last == actionData;
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: _QuickActionButton(
                  icon: actionData['icon'],
                  label: actionData['label'],
                  onTap: () =>
                      _handleQuickAction(actionData['action'], controller),
                ),
              ),
              if (!isLast) SizedBox(width: _buttonSpacing),
            ],
          ),
        );
      }).toList(),
    );
  }

  void _handleQuickAction(String action, DashboardController controller) {
    switch (action) {
      case 'post_service':
        // Navigate to post service
        break;
      case 'my_listings':
        controller.selectMenuItem(1);
        break;
      case 'browse':
        // Navigate to marketplace
        break;
    }
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

  // Button styling constants
  static final double _buttonBorderRadius = 12.r;
  static final EdgeInsets _buttonPadding = EdgeInsets.symmetric(
    vertical: 12.h,
    horizontal: 8.w,
  );
  static final double _iconSize = 24.w;
  static final double _iconTextSpacing = 8.h;
  static final double _labelFontSize = 12.sp;
  static const FontWeight _labelFontWeight = FontWeight.w600;
  static const double _backgroundOpacity = 0.1;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _buildBackgroundColor(context),
      borderRadius: BorderRadius.circular(_buttonBorderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_buttonBorderRadius),
        child: Container(
          padding: _buttonPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(context),
              SizedBox(height: _iconTextSpacing),
              _buildLabel(context),
            ],
          ),
        ),
      ),
    );
  }

  Color _buildBackgroundColor(BuildContext context) {
    return Theme.of(
      context,
    ).colorScheme.onPrimaryContainer.withOpacity(_backgroundOpacity);
  }

  Widget _buildIcon(BuildContext context) {
    return Icon(
      icon,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      size: _iconSize,
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: _labelFontSize,
        fontWeight: _labelFontWeight,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
