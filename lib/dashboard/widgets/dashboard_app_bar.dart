import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/controllers/app_navigation_controller.dart';
import 'package:rentoshare/dashboard/controllers/dashboard_controller.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  // AppBar styling constants
  static const double _appBarElevation = 0.0;
  static const Color _surfaceTintColor = Colors.transparent;

  // Welcome text styling constants
  static const double _welcomeTextFontSize = 16.0;
  static const FontWeight _welcomeTextFontWeight = FontWeight.w700;
  static const double _welcomeTextOpacity = 0.7;

  // Notification icon constants
  static const double _notificationIconSize = 24.0;
  static const double _notificationMarginRight = 8.0;
  static const double _notificationBadgeSize = 8.0;
  static const double _notificationBadgePositionRight = 8.0;
  static const double _notificationBadgePositionTop = 8.0;

  // Profile avatar constants
  static const double _profileAvatarRadius = 18.0;
  static const double _profileMarginRight = 16.0;
  static const double _profileTextFontSize = 14.0;
  static const FontWeight _profileTextFontWeight = FontWeight.w600;

  // Layout constants
  static const CrossAxisAlignment _titleCrossAxisAlignment =
      CrossAxisAlignment.start;
  static const double _tabletBreakpoint = 600.0;

  // Content constants
  static const String _welcomePrefix = 'Welcome back, ';
  static const String _defaultSeparator = ' ';
  static const String _initialsJoinSeparator = '';

  // Widget identifiers
  static const String _notificationIconKey = 'notification_icon';
  static const String _profileAvatarKey = 'profile_avatar';

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    final navController = Get.find<NavigationController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > _tabletBreakpoint;

        return AppBar(
          elevation: _appBarElevation,
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: _surfaceTintColor,
          leading: isTablet
              ? null
              : IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
          title: _buildTitle(dashboardController, context),
          actions: _buildActions(context, dashboardController),
        );
      },
    );
  }

  Widget _buildTitle(DashboardController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: _titleCrossAxisAlignment,
      children: [_buildWelcomeMessage(controller, context)],
    );
  }

  Widget _buildWelcomeMessage(
    DashboardController controller,
    BuildContext context,
  ) {
    return Obx(
      () => Text(
        _buildWelcomeText(controller.userName.value),
        style: _buildWelcomeTextStyle(context),
      ),
    );
  }

  String _buildWelcomeText(String fullName) {
    final firstName = fullName.split(_defaultSeparator).first;
    return '$_welcomePrefix$firstName';
  }

  TextStyle _buildWelcomeTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: _welcomeTextFontSize,
      fontWeight: _welcomeTextFontWeight,
      color: Theme.of(
        context,
      ).colorScheme.onSurface.withOpacity(_welcomeTextOpacity),
    );
  }

  List<Widget> _buildActions(
    BuildContext context,
    DashboardController controller,
  ) {
    return [
      _buildNotificationButton(context),
      _buildProfileAvatar(context, controller),
    ];
  }

  Widget _buildNotificationButton(BuildContext context) {
    return Container(
      key: const ValueKey(_notificationIconKey),
      margin: const EdgeInsets.only(right: _notificationMarginRight),
      child: Stack(
        children: [
          _buildNotificationIcon(context),
          _buildNotificationBadge(context),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.notifications_outlined,
        color: Theme.of(context).colorScheme.onSurface,
        size: _notificationIconSize,
      ),
      onPressed: _handleNotificationPressed,
    );
  }

  Widget _buildNotificationBadge(BuildContext context) {
    return Positioned(
      right: _notificationBadgePositionRight,
      top: _notificationBadgePositionTop,
      child: Container(
        width: _notificationBadgeSize,
        height: _notificationBadgeSize,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(
    BuildContext context,
    DashboardController controller,
  ) {
    return Container(
      key: const ValueKey(_profileAvatarKey),
      margin: const EdgeInsets.only(right: _profileMarginRight),
      child: GestureDetector(
        onTap: _handleProfileTap,
        child: CircleAvatar(
          radius: _profileAvatarRadius,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: _buildProfileInitials(context, controller),
        ),
      ),
    );
  }

  Widget _buildProfileInitials(
    BuildContext context,
    DashboardController controller,
  ) {
    return Obx(
      () => Text(
        _generateInitials(controller.userName.value),
        style: _buildProfileTextStyle(context),
      ),
    );
  }

  String _generateInitials(String fullName) {
    return fullName
        .split(_defaultSeparator)
        .map((word) => word.isNotEmpty ? word[0] : '')
        .join(_initialsJoinSeparator);
  }

  TextStyle _buildProfileTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: _profileTextFontSize,
      fontWeight: _profileTextFontWeight,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }

  void _handleNotificationPressed() {
    // Handle notifications navigation
  }

  void _handleProfileTap() {
    // Handle profile navigation
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
