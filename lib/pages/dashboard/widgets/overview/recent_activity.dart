import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  // Container styling constants
  static final double _containerBorderRadius = 16;
  static final double _containerBorderWidth = 1.0;
  static const double _containerBorderOpacity = 0.1;
  static const double _containerShadowOpacity = 0.05;
  static final double _containerShadowBlurRadius = 10;
  static final Offset _containerShadowOffset = Offset(0, 2);

  // Header layout constants
  static final EdgeInsets _headerPadding = EdgeInsets.fromLTRB(20, 20, 20, 16);
  static const MainAxisAlignment _headerMainAxisAlignment =
      MainAxisAlignment.spaceBetween;
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;

  // Header text styling constants
  static final double _headerTitleFontSize = 16.sp;
  static const FontWeight _headerTitleFontWeight = FontWeight.w700;
  static final double _headerButtonFontSize = 12.sp;
  static const FontWeight _headerButtonFontWeight = FontWeight.w600;

  // Empty state constants
  static final EdgeInsets _emptyStatePadding = EdgeInsets.all(20);
  static final double _emptyStateIconSize = 48;
  static final double _emptyStateSpacing = 12;
  static final double _emptyStateTitleFontSize = 14;
  static const FontWeight _emptyStateTitleFontWeight = FontWeight.w500;
  static const double _emptyStateIconOpacity = 0.3;
  static const double _emptyStateTitleOpacity = 0.5;

  // ListView constants
  static final EdgeInsets _listViewPadding = EdgeInsets.only(bottom: 16);
  static final double _dividerHeight = 1;
  static const double _dividerOpacity = 0.1;
  static const ScrollPhysics _listViewPhysics = NeverScrollableScrollPhysics();

  // Content constants
  static const String _headerTitle = 'Recent Activity';
  static const String _viewAllButtonText = 'View All';
  static const String _emptyStateTitle = 'No recent activity';
  static const IconData _emptyStateIcon = Icons.inbox_rounded;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Container(
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: _columnCrossAxisAlignment,
        children: [_buildHeader(context), _buildContent(context, controller)],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(_containerBorderRadius),
      border: Border.all(
        color: Theme.of(
          context,
        ).colorScheme.outline.withOpacity(_containerBorderOpacity),
        width: _containerBorderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(
            context,
          ).colorScheme.shadow.withOpacity(_containerShadowOpacity),
          blurRadius: _containerShadowBlurRadius,
          offset: _containerShadowOffset,
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: _headerPadding,
      child: Row(
        mainAxisAlignment: _headerMainAxisAlignment,
        children: [_buildHeaderTitle(context), _buildViewAllButton(context)],
      ),
    );
  }

  Widget _buildHeaderTitle(BuildContext context) {
    return Text(
      _headerTitle,
      style: TextStyle(
        fontSize: _headerTitleFontSize,
        fontWeight: _headerTitleFontWeight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildViewAllButton(BuildContext context) {
    return TextButton(
      onPressed: _handleViewAllPressed,
      child: Text(
        _viewAllButtonText,
        style: TextStyle(
          fontSize: _headerButtonFontSize,
          fontWeight: _headerButtonFontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, DashboardController controller) {
    return Obx(() {
      if (controller.recentActivities.isEmpty) {
        return _buildEmptyState(context);
      }
      return _buildActivityList(context, controller);
    });
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: _emptyStatePadding,
      child: Center(
        child: Column(
          children: [
            _buildEmptyStateIcon(context),
            SizedBox(height: _emptyStateSpacing),
            _buildEmptyStateTitle(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyStateIcon(BuildContext context) {
    return Icon(
      _emptyStateIcon,
      size: _emptyStateIconSize,
      color: Theme.of(
        context,
      ).colorScheme.onSurface.withOpacity(_emptyStateIconOpacity),
    );
  }

  Widget _buildEmptyStateTitle(BuildContext context) {
    return Text(
      _emptyStateTitle,
      style: TextStyle(
        fontSize: _emptyStateTitleFontSize,
        fontWeight: _emptyStateTitleFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_emptyStateTitleOpacity),
      ),
    );
  }

  Widget _buildActivityList(
    BuildContext context,
    DashboardController controller,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      physics: _listViewPhysics,
      padding: _listViewPadding,
      itemCount: controller.recentActivities.length,
      separatorBuilder: (context, index) => _buildDivider(context),
      itemBuilder: (context, index) =>
          _ActivityItem(activity: controller.recentActivities[index]),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: _dividerHeight,
      color: Theme.of(context).colorScheme.outline.withOpacity(_dividerOpacity),
    );
  }

  void _handleViewAllPressed() {
    // Handle view all activities navigation
  }
}

class _ActivityItem extends StatelessWidget {
  final ActivityItem activity;

  const _ActivityItem({required this.activity});

  // Item layout constants
  static final EdgeInsets _itemPadding = EdgeInsets.symmetric(
    horizontal: 20.w,
    vertical: 16.h,
  );
  static final double _iconContainerPadding = 10;
  static final double _iconContainerBorderRadius = 10;
  static final double _iconSize = 20;
  static final double _iconSpacing = 16;
  static final double _textSpacing = 4;
  static final double _timestampSpacing = 8;

  // Text styling constants
  static final double _titleFontSize = 14;
  static const FontWeight _titleFontWeight = FontWeight.w600;
  static final double _subtitleFontSize = 12;
  static const FontWeight _subtitleFontWeight = FontWeight.w400;
  static final double _timestampFontSize = 11;
  static const FontWeight _timestampFontWeight = FontWeight.w400;

  // Text opacity constants
  static const double _iconBackgroundOpacity = 0.1;
  static const double _subtitleOpacity = 0.7;
  static const double _timestampOpacity = 0.5;

  // Text overflow constants
  static const int _titleMaxLines = 1;
  static const int _subtitleMaxLines = 1;
  static const TextOverflow _textOverflow = TextOverflow.ellipsis;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;

  // Activity type to icon mapping
  static const Map<ActivityType, IconData> _activityIcons = {
    ActivityType.message: Icons.message_rounded,
    ActivityType.payment: Icons.payments_rounded,
    ActivityType.review: Icons.star_rounded,
    ActivityType.listing: Icons.list_alt_rounded,
    ActivityType.rental: Icons.shopping_bag_rounded,
  };

  // Activity type to color mapping
  static const Map<ActivityType, Color> _activityColors = {
    ActivityType.message: Color(0xFF06B6D4),
    ActivityType.payment: Color(0xFF10B981),
    ActivityType.review: Color(0xFFF59E0B),
    ActivityType.listing: Color(0xFF8B5CF6),
    ActivityType.rental: Color(0xFFEF4444),
  };

  // Time format constants
  static const String _timeFormatJustNow = 'Just now';
  static const String _timeFormatMinutes = 'm ago';
  static const String _timeFormatHours = 'h ago';
  static const String _timeFormatDays = 'd ago';
  static const String _timeFormatWeeks = 'w ago';

  // Time threshold constants
  static const int _oneMinuteInMinutes = 1;
  static const int _oneHourInMinutes = 60;
  static const int _oneDayInHours = 24;
  static const int _oneWeekInDays = 7;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleActivityTap,
        child: Padding(
          padding: _itemPadding,
          child: Row(
            children: [
              _buildIconContainer(),
              SizedBox(width: _iconSpacing),
              _buildTextContent(context),
              SizedBox(width: _timestampSpacing),
              _buildTimestamp(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: EdgeInsets.all(_iconContainerPadding),
      decoration: BoxDecoration(
        color: _getActivityColor().withOpacity(_iconBackgroundOpacity),
        borderRadius: BorderRadius.circular(_iconContainerBorderRadius),
      ),
      child: Icon(
        _getActivityIcon(),
        color: _getActivityColor(),
        size: _iconSize,
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: _columnCrossAxisAlignment,
        children: [
          _buildTitle(context),
          SizedBox(height: _textSpacing),
          _buildSubtitle(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      activity.title,
      style: TextStyle(
        fontSize: _titleFontSize,
        fontWeight: _titleFontWeight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      maxLines: _titleMaxLines,
      overflow: _textOverflow,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      activity.subtitle,
      style: TextStyle(
        fontSize: _subtitleFontSize,
        fontWeight: _subtitleFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_subtitleOpacity),
      ),
      maxLines: _subtitleMaxLines,
      overflow: _textOverflow,
    );
  }

  Widget _buildTimestamp(BuildContext context) {
    return Text(
      _getTimeAgo(activity.timestamp),
      style: TextStyle(
        fontSize: _timestampFontSize,
        fontWeight: _timestampFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_timestampOpacity),
      ),
    );
  }

  IconData _getActivityIcon() {
    return _activityIcons[activity.type] ?? Icons.help_rounded;
  }

  Color _getActivityColor() {
    return _activityColors[activity.type] ?? Colors.grey;
  }

  String _getTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < _oneMinuteInMinutes) {
      return _timeFormatJustNow;
    } else if (difference.inMinutes < _oneHourInMinutes) {
      return '${difference.inMinutes}$_timeFormatMinutes';
    } else if (difference.inHours < _oneDayInHours) {
      return '${difference.inHours}$_timeFormatHours';
    } else if (difference.inDays < _oneWeekInDays) {
      return '${difference.inDays}$_timeFormatDays';
    } else {
      return '${(difference.inDays / _oneWeekInDays).floor()}$_timeFormatWeeks';
    }
  }

  void _handleActivityTap() {
    // Handle activity item tap
  }
}
