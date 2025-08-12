import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendations = [
      RecommendationItem(
        type: RecommendationType.demand,
        title: 'High Demand in Your Area',
        subtitle: 'Camera equipment',
        description:
            'Users near you are looking for camera gear. Avg. earning: \$45/day',
        icon: Icons.camera_alt_rounded,
        iconColor: const Color(0xFF8B5CF6),
        actionText: 'Post Camera',
      ),
      RecommendationItem(
        type: RecommendationType.trending,
        title: 'Trending This Week',
        subtitle: 'Gaming consoles',
        description:
            'Similar vendors earned \$280 last week with gaming rentals',
        icon: Icons.sports_esports_rounded,
        iconColor: const Color(0xFF06B6D4),
        actionText: 'Explore Gaming',
      ),
      RecommendationItem(
        type: RecommendationType.opportunity,
        title: 'New Opportunity',
        subtitle: 'Party equipment',
        description: 'Weekend events coming up. Great time to list party gear',
        icon: Icons.celebration_rounded,
        iconColor: const Color(0xFFF59E0B),
        actionText: 'List Equipment',
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
                Icons.trending_up_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 20.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendations.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final recommendation = recommendations[index];
              return _RecommendationCard(recommendation: recommendation);
            },
          ),
        ],
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final RecommendationItem recommendation;

  const _RecommendationCard({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: recommendation.iconColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: recommendation.iconColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: recommendation.iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              recommendation.icon,
              color: recommendation.iconColor,
              size: 24.w,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recommendation.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  recommendation.subtitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: recommendation.iconColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  recommendation.description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Handle recommendation action
              },
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: recommendation.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: recommendation.iconColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  recommendation.actionText,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: recommendation.iconColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationItem {
  final RecommendationType type;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color iconColor;
  final String actionText;

  RecommendationItem({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.actionText,
  });
}

enum RecommendationType { demand, trending, opportunity }
