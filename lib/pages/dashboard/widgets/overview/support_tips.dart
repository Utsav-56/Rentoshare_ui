import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportTips extends StatelessWidget {
  const SupportTips({super.key});

  @override
  Widget build(BuildContext context) {
    final supportItems = [
      SupportItem(
        icon: Icons.help_center_rounded,
        title: 'Platform Guide',
        subtitle: 'Learn how to maximize your earnings',
        color: const Color(0xFF10B981),
      ),
      SupportItem(
        icon: Icons.gavel_rounded,
        title: 'Dispute Center',
        subtitle: 'Resolve issues with rentals',
        color: const Color(0xFFEF4444),
      ),
      SupportItem(
        icon: Icons.lightbulb_rounded,
        title: 'Earning Tips',
        subtitle: 'Best practices for successful listings',
        color: const Color(0xFFF59E0B),
      ),
      SupportItem(
        icon: Icons.support_agent_rounded,
        title: '24/7 Support',
        subtitle: 'Get help when you need it',
        color: const Color(0xFF8B5CF6),
      ),
    ];

    return Container(
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
            children: [
              Icon(
                Icons.support_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 20.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Support & Resources',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.8,
            ),
            itemCount: supportItems.length,
            itemBuilder: (context, index) {
              final item = supportItems[index];
              return _SupportCard(item: item);
            },
          ),
        ],
      ),
    );
  }
}

class _SupportCard extends StatelessWidget {
  final SupportItem item;

  const _SupportCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Handle support item tap
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: item.color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: item.color.withOpacity(0.1), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(item.icon, color: item.color, size: 20.w),
              ),
              SizedBox(height: 12.h),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.h),
              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  SupportItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}
