import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportTips extends StatelessWidget {
  const SupportTips({super.key});

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

  // Grid layout constants
  static const int _gridCrossAxisCount = 2;
  static const double _gridCrossAxisSpacing = 12.0;
  static const double _gridMainAxisSpacing = 12.0;
  static const double _gridChildAspectRatio = 1.8;
  static const ScrollPhysics _gridScrollPhysics =
      NeverScrollableScrollPhysics();
  static const bool _gridShrinkWrap = true;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;

  // Content constants
  static const String _sectionTitle = 'Support & Resources';
  static const IconData _sectionIcon = Icons.support_rounded;

  // Support items data
  static const String _platformGuideTitle = 'Platform Guide';
  static const String _platformGuideSubtitle =
      'Learn how to maximize your earnings';
  static const IconData _platformGuideIcon = Icons.help_center_rounded;
  static const Color _platformGuideColor = Color(0xFF10B981);

  static const String _disputeCenterTitle = 'Dispute Center';
  static const String _disputeCenterSubtitle = 'Resolve issues with rentals';
  static const IconData _disputeCenterIcon = Icons.gavel_rounded;
  static const Color _disputeCenterColor = Color(0xFFEF4444);

  static const String _earningTipsTitle = 'Earning Tips';
  static const String _earningTipsSubtitle =
      'Best practices for successful listings';
  static const IconData _earningTipsIcon = Icons.lightbulb_rounded;
  static const Color _earningTipsColor = Color(0xFFF59E0B);

  static const String _supportAgentTitle = '24/7 Support';
  static const String _supportAgentSubtitle = 'Get help when you need it';
  static const IconData _supportAgentIcon = Icons.support_agent_rounded;
  static const Color _supportAgentColor = Color(0xFF8B5CF6);

  // Predefined support items data
  static final List<SupportItem> _supportItemsData = [
    SupportItem(
      icon: _platformGuideIcon,
      title: _platformGuideTitle,
      subtitle: _platformGuideSubtitle,
      color: _platformGuideColor,
    ),
    SupportItem(
      icon: _disputeCenterIcon,
      title: _disputeCenterTitle,
      subtitle: _disputeCenterSubtitle,
      color: _disputeCenterColor,
    ),
    SupportItem(
      icon: _earningTipsIcon,
      title: _earningTipsTitle,
      subtitle: _earningTipsSubtitle,
      color: _earningTipsColor,
    ),
    SupportItem(
      icon: _supportAgentIcon,
      title: _supportAgentTitle,
      subtitle: _supportAgentSubtitle,
      color: _supportAgentColor,
    ),
  ];

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
          _buildSupportGrid(),
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

  Widget _buildSupportGrid() {
    return GridView.builder(
      shrinkWrap: _gridShrinkWrap,
      physics: _gridScrollPhysics,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _gridCrossAxisCount,
        crossAxisSpacing: _gridCrossAxisSpacing,
        mainAxisSpacing: _gridMainAxisSpacing,
        childAspectRatio: _gridChildAspectRatio,
      ),
      itemCount: _supportItemsData.length,
      itemBuilder: (context, index) =>
          _SupportCard(item: _supportItemsData[index]),
    );
  }
}

class _SupportCard extends StatelessWidget {
  final SupportItem item;

  const _SupportCard({required this.item});

  // Card styling constants
  static const double _cardPadding = 16.0;
  static const double _cardBorderRadius = 12.0;
  static const double _cardBorderWidth = 1.0;
  static const double _cardBackgroundOpacity = 0.05;
  static const double _cardBorderOpacity = 0.1;

  // Icon container constants
  static const double _iconContainerPadding = 8.0;
  static const double _iconContainerBorderRadius = 8.0;
  static const double _iconSize = 20.0;
  static const double _iconBackgroundOpacity = 0.1;
  static const double _iconSpacing = 12.0;

  // Text styling constants
  static const double _titleFontSize = 13.0;
  static const FontWeight _titleFontWeight = FontWeight.w600;
  static const double _subtitleFontSize = 11.0;
  static const FontWeight _subtitleFontWeight = FontWeight.w400;
  static const double _subtitleOpacity = 0.7;

  // Text spacing constants
  static const double _titleSubtitleSpacing = 2.0;

  // Text overflow constants
  static const int _titleMaxLines = 1;
  static const int _subtitleMaxLines = 2;
  static const TextOverflow _textOverflow = TextOverflow.ellipsis;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;
  static const MainAxisAlignment _columnMainAxisAlignment =
      MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleSupportItemTap,
        borderRadius: BorderRadius.circular(_cardBorderRadius),
        child: Container(
          padding: const EdgeInsets.all(_cardPadding),
          decoration: _buildCardDecoration(),
          child: Column(
            crossAxisAlignment: _columnCrossAxisAlignment,
            mainAxisAlignment: _columnMainAxisAlignment,
            children: [
              _buildIconContainer(),
              const SizedBox(height: _iconSpacing),
              _buildTitle(context),
              const SizedBox(height: _titleSubtitleSpacing),
              _buildSubtitle(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: item.color.withOpacity(_cardBackgroundOpacity),
      borderRadius: BorderRadius.circular(_cardBorderRadius),
      border: Border.all(
        color: item.color.withOpacity(_cardBorderOpacity),
        width: _cardBorderWidth,
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: const EdgeInsets.all(_iconContainerPadding),
      decoration: BoxDecoration(
        color: item.color.withOpacity(_iconBackgroundOpacity),
        borderRadius: BorderRadius.circular(_iconContainerBorderRadius),
      ),
      child: Icon(item.icon, color: item.color, size: _iconSize),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      item.title,
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
      item.subtitle,
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

  void _handleSupportItemTap() {
    // Handle support item tap based on the item type
    // This could navigate to different support sections
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
