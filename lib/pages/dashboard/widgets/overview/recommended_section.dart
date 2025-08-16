import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  // Container styling constants
  static const double _containerPadding = 20.0;
  static const double _containerBorderRadius = 16.0;
  static const double _containerBorderWidth = 1.0;
  static const double _containerBorderOpacity = 0.1;
  static const double _containerShadowOpacity = 0.05;
  static const double _containerShadowBlur = 10.0;
  static const double _containerShadowOffsetX = 0.0;
  static const double _containerShadowOffsetY = 2.0;

  // Header layout constants
  static const double _headerIconSize = 20.0;
  static const double _headerIconSpacing = 8.0;
  static const double _headerBottomSpacing = 16.0;

  // Header text styling constants
  static const double _headerTitleFontSize = 16.0;
  static const FontWeight _headerTitleFontWeight = FontWeight.w700;

  // ListView constants
  static const double _itemSpacing = 16.0;
  static const ScrollPhysics _listViewPhysics = NeverScrollableScrollPhysics();
  static const bool _listViewShrinkWrap = true;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;

  // Content constants
  static const String _sectionTitle = 'Recommended for You';
  static const IconData _sectionIcon = Icons.trending_up_rounded;

  // Predefined recommendation data
  static final List<RecommendationItem> _recommendationData = [
    RecommendationItem(
      type: RecommendationType.demand,
      title: _demandTitle,
      subtitle: _demandSubtitle,
      description: _demandDescription,
      icon: _demandIcon,
      iconColor: _demandColor,
      actionText: _demandActionText,
    ),
    RecommendationItem(
      type: RecommendationType.trending,
      title: _trendingTitle,
      subtitle: _trendingSubtitle,
      description: _trendingDescription,
      icon: _trendingIcon,
      iconColor: _trendingColor,
      actionText: _trendingActionText,
    ),
    RecommendationItem(
      type: RecommendationType.opportunity,
      title: _opportunityTitle,
      subtitle: _opportunitySubtitle,
      description: _opportunityDescription,
      icon: _opportunityIcon,
      iconColor: _opportunityColor,
      actionText: _opportunityActionText,
    ),
  ];

  // Recommendation content constants
  static const String _demandTitle = 'High Demand in Your Area';
  static const String _demandSubtitle = 'Camera equipment';
  static const String _demandDescription =
      'Users near you are looking for camera gear. Avg. earning: \$45/day';
  static const IconData _demandIcon = Icons.camera_alt_rounded;
  static const Color _demandColor = Color(0xFF8B5CF6);
  static const String _demandActionText = 'Post Camera';

  static const String _trendingTitle = 'Trending This Week';
  static const String _trendingSubtitle = 'Gaming consoles';
  static const String _trendingDescription =
      'Similar vendors earned \$280 last week with gaming rentals';
  static const IconData _trendingIcon = Icons.sports_esports_rounded;
  static const Color _trendingColor = Color(0xFF06B6D4);
  static const String _trendingActionText = 'Explore Gaming';

  static const String _opportunityTitle = 'New Opportunity';
  static const String _opportunitySubtitle = 'Party equipment';
  static const String _opportunityDescription =
      'Weekend events coming up. Great time to list party gear';
  static const IconData _opportunityIcon = Icons.celebration_rounded;
  static const Color _opportunityColor = Color(0xFFF59E0B);
  static const String _opportunityActionText = 'List Equipment';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_containerPadding),
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: _columnCrossAxisAlignment,
        children: [
          _buildHeader(context),
          const SizedBox(height: _headerBottomSpacing),
          _buildRecommendationsList(),
        ],
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
          blurRadius: _containerShadowBlur,
          offset: const Offset(
            _containerShadowOffsetX,
            _containerShadowOffsetY,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        _buildHeaderIcon(context),
        const SizedBox(width: _headerIconSpacing),
        _buildHeaderTitle(context),
      ],
    );
  }

  Widget _buildHeaderIcon(BuildContext context) {
    return Icon(
      _sectionIcon,
      color: Theme.of(context).colorScheme.primary,
      size: _headerIconSize,
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

  Widget _buildRecommendationsList() {
    return ListView.separated(
      shrinkWrap: _listViewShrinkWrap,
      physics: _listViewPhysics,
      itemCount: _recommendationData.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: _itemSpacing),
      itemBuilder: (context, index) =>
          _RecommendationCard(recommendation: _recommendationData[index]),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final RecommendationItem recommendation;

  const _RecommendationCard({required this.recommendation});

  // Card styling constants
  static const double _cardPadding = 16.0;
  static const double _cardBorderRadius = 12.0;
  static const double _cardBorderWidth = 1.0;
  static const double _cardBackgroundOpacity = 0.05;
  static const double _cardBorderOpacity = 0.2;

  // Icon container constants
  static const double _iconContainerPadding = 12.0;
  static const double _iconContainerBorderRadius = 10.0;
  static const double _iconSize = 24.0;
  static const double _iconBackgroundOpacity = 0.1;
  static const double _iconSpacing = 16.0;

  // Text styling constants
  static const double _titleFontSize = 14.0;
  static const FontWeight _titleFontWeight = FontWeight.w600;
  static const double _subtitleFontSize = 13.0;
  static const FontWeight _subtitleFontWeight = FontWeight.w700;
  static const double _descriptionFontSize = 12.0;
  static const FontWeight _descriptionFontWeight = FontWeight.w400;
  static const double _descriptionOpacity = 0.7;

  // Text spacing constants
  static const double _titleSubtitleSpacing = 2.0;
  static const double _subtitleDescriptionSpacing = 4.0;

  // Action button constants
  static const double _actionButtonSpacing = 12.0;
  static const double _actionButtonPaddingHorizontal = 12.0;
  static const double _actionButtonPaddingVertical = 8.0;
  static const double _actionButtonBorderRadius = 8.0;
  static const double _actionButtonBorderWidth = 1.0;
  static const double _actionButtonBackgroundOpacity = 0.1;
  static const double _actionButtonBorderOpacity = 0.3;
  static const double _actionButtonFontSize = 11.0;
  static const FontWeight _actionButtonFontWeight = FontWeight.w600;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_cardPadding),
      decoration: _buildCardDecoration(),
      child: Row(
        children: [
          _buildIconContainer(),
          const SizedBox(width: _iconSpacing),
          _buildTextContent(context),
          const SizedBox(width: _actionButtonSpacing),
          _buildActionButton(context),
        ],
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: recommendation.iconColor.withOpacity(_cardBackgroundOpacity),
      borderRadius: BorderRadius.circular(_cardBorderRadius),
      border: Border.all(
        color: recommendation.iconColor.withOpacity(_cardBorderOpacity),
        width: _cardBorderWidth,
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: const EdgeInsets.all(_iconContainerPadding),
      decoration: BoxDecoration(
        color: recommendation.iconColor.withOpacity(_iconBackgroundOpacity),
        borderRadius: BorderRadius.circular(_iconContainerBorderRadius),
      ),
      child: Icon(
        recommendation.icon,
        color: recommendation.iconColor,
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
          const SizedBox(height: _titleSubtitleSpacing),
          _buildSubtitle(),
          const SizedBox(height: _subtitleDescriptionSpacing),
          _buildDescription(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      recommendation.title,
      style: TextStyle(
        fontSize: _titleFontSize,
        fontWeight: _titleFontWeight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      recommendation.subtitle,
      style: TextStyle(
        fontSize: _subtitleFontSize,
        fontWeight: _subtitleFontWeight,
        color: recommendation.iconColor,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      recommendation.description,
      style: TextStyle(
        fontSize: _descriptionFontSize,
        fontWeight: _descriptionFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_descriptionOpacity),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleActionButtonTap,
        borderRadius: BorderRadius.circular(_actionButtonBorderRadius),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: _actionButtonPaddingHorizontal,
            vertical: _actionButtonPaddingVertical,
          ),
          decoration: _buildActionButtonDecoration(),
          child: _buildActionButtonText(),
        ),
      ),
    );
  }

  BoxDecoration _buildActionButtonDecoration() {
    return BoxDecoration(
      color: recommendation.iconColor.withOpacity(
        _actionButtonBackgroundOpacity,
      ),
      borderRadius: BorderRadius.circular(_actionButtonBorderRadius),
      border: Border.all(
        color: recommendation.iconColor.withOpacity(_actionButtonBorderOpacity),
        width: _actionButtonBorderWidth,
      ),
    );
  }

  Widget _buildActionButtonText() {
    return Text(
      recommendation.actionText,
      style: TextStyle(
        fontSize: _actionButtonFontSize,
        fontWeight: _actionButtonFontWeight,
        color: recommendation.iconColor,
      ),
    );
  }

  void _handleActionButtonTap() {
    // Handle recommendation action based on type
    switch (recommendation.type) {
      case RecommendationType.demand:
        // Navigate to post camera equipment
        break;
      case RecommendationType.trending:
        // Navigate to gaming equipment section
        break;
      case RecommendationType.opportunity:
        // Navigate to party equipment section
        break;
    }
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
