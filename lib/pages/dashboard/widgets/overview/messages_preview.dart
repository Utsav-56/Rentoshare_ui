import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class MessagesPreview extends StatelessWidget {
  const MessagesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    // Mock message data for preview
    final messages = [
      MessagePreviewItem(
        senderName: 'Sarah Johnson',
        lastMessage: 'Is the iPhone still available?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        isUnread: true,
        avatar: 'SJ',
      ),
      MessagePreviewItem(
        senderName: 'Mike Chen',
        lastMessage: 'Thanks for the quick delivery!',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isUnread: false,
        avatar: 'MC',
      ),
      MessagePreviewItem(
        senderName: 'Emma Wilson',
        lastMessage: 'When can I pick up the camera?',
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        isUnread: true,
        avatar: 'EW',
      ),
    ];

    return Container(
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
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onError,
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    controller.selectMenuItem(3);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 16.h),
            itemCount: messages.length,
            separatorBuilder: (context, index) => Divider(
              height: 1.h,
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            ),
            itemBuilder: (context, index) {
              final message = messages[index];
              return _MessagePreviewItem(message: message);
            },
          ),
        ],
      ),
    );
  }
}

class _MessagePreviewItem extends StatelessWidget {
  final MessagePreviewItem message;

  const _MessagePreviewItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigate to message details
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          color: message.isUnread
              ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.05)
              : Colors.transparent,
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  message.avatar,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          message.senderName,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (message.isUnread)
                          Container(
                            width: 8.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      message.lastMessage,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      _getTimeAgo(message.timestamp),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${(difference.inDays / 7).floor()}w ago';
    }
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
