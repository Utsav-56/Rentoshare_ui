import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class MessagesPreview extends StatelessWidget {
  const MessagesPreview({super.key});

  // Container styling constants
  static const double _containerBorderRadius = 16.0;
  static const double _containerBorderWidth = 1.0;
  static const double _containerBorderOpacity = 0.1;
  static const double _containerShadowOpacity = 0.05;
  static const double _containerShadowBlur = 10.0;
  static const double _containerShadowOffsetX = 0.0;
  static const double _containerShadowOffsetY = 2.0;

  // Header layout constants
  static const double _headerPaddingTop = 20.0;
  static const double _headerPaddingBottom = 16.0;
  static const double _headerPaddingHorizontal = 20.0;
  static const double _headerTitleBadgeSpacing = 8.0;

  // Header text styling constants
  static const double _headerTitleFontSize = 16.0;
  static const FontWeight _headerTitleFontWeight = FontWeight.w700;
  static const double _viewAllButtonFontSize = 12.0;
  static const FontWeight _viewAllButtonFontWeight = FontWeight.w600;

  // Badge styling constants
  static const double _badgeHorizontalPadding = 6.0;
  static const double _badgeVerticalPadding = 2.0;
  static const double _badgeBorderRadius = 8.0;
  static const double _badgeFontSize = 10.0;
  static const FontWeight _badgeFontWeight = FontWeight.w600;

  // ListView constants
  static const double _listBottomPadding = 16.0;
  static const double _dividerHeight = 1.0;
  static const double _dividerOpacity = 0.1;
  static const ScrollPhysics _listPhysics = NeverScrollableScrollPhysics();
  static const bool _listShrinkWrap = true;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;
  static const MainAxisAlignment _headerMainAxisAlignment =
      MainAxisAlignment.spaceBetween;

  // Content constants
  static const String _sectionTitle = 'Messages';
  static const String _viewAllButtonText = 'View All';
  static const String _unreadCountText = '2';

  // Menu index constants
  static const int _messagesMenuIndex = 3;

  // Time duration constants for mock data
  static const int _message1MinutesAgo = 5;
  static const int _message2HoursAgo = 2;
  static const int _message3HoursAgo = 4;

  // Mock message data constants
  static const String _message1SenderName = 'Sarah Johnson';
  static const String _message1Text = 'Is the iPhone still available?';
  static const String _message1Avatar = 'SJ';
  static const bool _message1Unread = true;

  static const String _message2SenderName = 'Mike Chen';
  static const String _message2Text = 'Thanks for the quick delivery!';
  static const String _message2Avatar = 'MC';
  static const bool _message2Unread = false;

  static const String _message3SenderName = 'Emma Wilson';
  static const String _message3Text = 'When can I pick up the camera?';
  static const String _message3Avatar = 'EW';
  static const bool _message3Unread = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final messages = _buildMockMessages();

    return Container(
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: _columnCrossAxisAlignment,
        children: [
          _buildHeader(context, controller),
          _buildMessagesList(messages),
        ],
      ),
    );
  }

  List<MessagePreviewItem> _buildMockMessages() {
    return [
      MessagePreviewItem(
        senderName: _message1SenderName,
        lastMessage: _message1Text,
        timestamp: DateTime.now().subtract(
          const Duration(minutes: _message1MinutesAgo),
        ),
        isUnread: _message1Unread,
        avatar: _message1Avatar,
      ),
      MessagePreviewItem(
        senderName: _message2SenderName,
        lastMessage: _message2Text,
        timestamp: DateTime.now().subtract(
          const Duration(hours: _message2HoursAgo),
        ),
        isUnread: _message2Unread,
        avatar: _message2Avatar,
      ),
      MessagePreviewItem(
        senderName: _message3SenderName,
        lastMessage: _message3Text,
        timestamp: DateTime.now().subtract(
          const Duration(hours: _message3HoursAgo),
        ),
        isUnread: _message3Unread,
        avatar: _message3Avatar,
      ),
    ];
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
          blurRadius: _containerShadowBlur,
          offset: const Offset(
            _containerShadowOffsetX,
            _containerShadowOffsetY,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, DashboardController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _headerPaddingHorizontal,
        _headerPaddingTop,
        _headerPaddingHorizontal,
        _headerPaddingBottom,
      ),
      child: Row(
        mainAxisAlignment: _headerMainAxisAlignment,
        children: [
          _buildHeaderLeft(context),
          _buildViewAllButton(context, controller),
        ],
      ),
    );
  }

  Widget _buildHeaderLeft(BuildContext context) {
    return Row(
      children: [
        _buildHeaderTitle(context),
        const SizedBox(width: _headerTitleBadgeSpacing),
        _buildUnreadBadge(context),
      ],
    );
  }

  Widget _buildHeaderTitle(BuildContext context) {
    return Text(
      _sectionTitle,
      style: TextStyle(
        fontSize: _headerTitleFontSize,
        fontWeight: _headerTitleFontWeight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildUnreadBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _badgeHorizontalPadding,
        vertical: _badgeVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(_badgeBorderRadius),
      ),
      child: Text(
        _unreadCountText,
        style: TextStyle(
          fontSize: _badgeFontSize,
          fontWeight: _badgeFontWeight,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
    );
  }

  Widget _buildViewAllButton(
    BuildContext context,
    DashboardController controller,
  ) {
    return TextButton(
      onPressed: () => controller.selectMenuItem(_messagesMenuIndex),
      child: Text(
        _viewAllButtonText,
        style: TextStyle(
          fontSize: _viewAllButtonFontSize,
          fontWeight: _viewAllButtonFontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildMessagesList(List<MessagePreviewItem> messages) {
    return ListView.separated(
      shrinkWrap: _listShrinkWrap,
      physics: _listPhysics,
      padding: const EdgeInsets.only(bottom: _listBottomPadding),
      itemCount: messages.length,
      separatorBuilder: (context, index) => _buildDivider(context),
      itemBuilder: (context, index) =>
          _MessagePreviewItem(message: messages[index]),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: _dividerHeight,
      color: Theme.of(context).colorScheme.outline.withOpacity(_dividerOpacity),
    );
  }
}

class _MessagePreviewItem extends StatelessWidget {
  final MessagePreviewItem message;

  const _MessagePreviewItem({required this.message});

  // Item layout constants
  static const double _itemPaddingHorizontal = 20.0;
  static const double _itemPaddingVertical = 12.0;
  static const double _unreadBackgroundOpacity = 0.05;

  // Avatar constants
  static const double _avatarRadius = 20.0;
  static const double _avatarSpacing = 12.0;
  static const double _avatarFontSize = 12.0;
  static const FontWeight _avatarFontWeight = FontWeight.w600;

  // Text styling constants
  static const double _senderNameFontSize = 13.0;
  static const FontWeight _senderNameFontWeight = FontWeight.w600;
  static const double _lastMessageFontSize = 12.0;
  static const FontWeight _lastMessageFontWeight = FontWeight.w400;
  static const double _lastMessageOpacity = 0.7;
  static const double _timestampFontSize = 10.0;
  static const FontWeight _timestampFontWeight = FontWeight.w400;
  static const double _timestampOpacity = 0.5;

  // Spacing constants
  static const double _nameTimestampSpacing = 4.0;
  static const double _messageTimestampSpacing = 2.0;

  // Unread indicator constants
  static const double _unreadIndicatorSize = 8.0;

  // Text overflow constants
  static const int _maxLines = 1;
  static const TextOverflow _textOverflow = TextOverflow.ellipsis;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;
  static const MainAxisAlignment _rowMainAxisAlignment =
      MainAxisAlignment.spaceBetween;

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
        onTap: _handleMessageTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: _itemPaddingHorizontal,
            vertical: _itemPaddingVertical,
          ),
          color: _buildItemBackgroundColor(context),
          child: Row(
            children: [
              _buildAvatar(context),
              const SizedBox(width: _avatarSpacing),
              _buildMessageContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Color _buildItemBackgroundColor(BuildContext context) {
    return message.isUnread
        ? Theme.of(
            context,
          ).colorScheme.primaryContainer.withOpacity(_unreadBackgroundOpacity)
        : Colors.transparent;
  }

  Widget _buildAvatar(BuildContext context) {
    return CircleAvatar(
      radius: _avatarRadius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Text(
        message.avatar,
        style: TextStyle(
          fontSize: _avatarFontSize,
          fontWeight: _avatarFontWeight,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: _columnCrossAxisAlignment,
        children: [
          _buildSenderNameRow(context),
          const SizedBox(height: _nameTimestampSpacing),
          _buildLastMessage(context),
          const SizedBox(height: _messageTimestampSpacing),
          _buildTimestamp(context),
        ],
      ),
    );
  }

  Widget _buildSenderNameRow(BuildContext context) {
    return Row(
      mainAxisAlignment: _rowMainAxisAlignment,
      children: [
        _buildSenderName(context),
        if (message.isUnread) _buildUnreadIndicator(context),
      ],
    );
  }

  Widget _buildSenderName(BuildContext context) {
    return Expanded(
      child: Text(
        message.senderName,
        style: TextStyle(
          fontSize: _senderNameFontSize,
          fontWeight: _senderNameFontWeight,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        maxLines: _maxLines,
        overflow: _textOverflow,
      ),
    );
  }

  Widget _buildUnreadIndicator(BuildContext context) {
    return Container(
      width: _unreadIndicatorSize,
      height: _unreadIndicatorSize,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildLastMessage(BuildContext context) {
    return Text(
      message.lastMessage,
      style: TextStyle(
        fontSize: _lastMessageFontSize,
        fontWeight: _lastMessageFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_lastMessageOpacity),
      ),
      maxLines: _maxLines,
      overflow: _textOverflow,
    );
  }

  Widget _buildTimestamp(BuildContext context) {
    return Text(
      _getTimeAgo(message.timestamp),
      style: TextStyle(
        fontSize: _timestampFontSize,
        fontWeight: _timestampFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_timestampOpacity),
      ),
    );
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

  void _handleMessageTap() {
    // Navigate to message details
  }
}

class MessagePreviewItem {
  final String senderName;
  final String lastMessage;
  final DateTime timestamp;
  final bool isUnread;
  final String avatar;

  MessagePreviewItem({
    required this.senderName,
    required this.lastMessage,
    required this.timestamp,
    required this.isUnread,
    required this.avatar,
  });
}
