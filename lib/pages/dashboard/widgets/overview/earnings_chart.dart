import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';

class EarningsChart extends StatelessWidget {
  const EarningsChart({super.key});

  // Container styling constants
  static final double _containerPadding = 20;
  static final double _containerBorderRadius = 16;
  static final double _containerBorderWidth = 1.0;
  static const double _containerBorderOpacity = 0.1;
  static const double _containerShadowOpacity = 0.05;
  static final double _containerShadowBlur = 10;
  static final Offset _containerShadowOffset = Offset(0, 2);

  // Header layout constants
  static final double _headerTitleBottomSpacing = 4;
  static final double _headerBottomSpacing = 24;
  static final double _periodButtonSpacing = 8;

  // Header text styling constants
  static final double _titleFontSize = 16;
  static const FontWeight _titleFontWeight = FontWeight.w700;
  static final double _totalEarningsFontSize = 24;
  static const FontWeight _totalEarningsFontWeight = FontWeight.w700;
  static const int _totalEarningsDecimalPlaces = 0;

  // Chart constants
  static final double _chartHeight = 200;
  static final double _chartBottomSpacing = 20;

  // Button constants
  static final double _buttonIconSize = 20;
  static final double _buttonFontSize = 14;
  static const FontWeight _buttonFontWeight = FontWeight.w600;
  static final EdgeInsets _buttonPadding = EdgeInsets.symmetric(vertical: 12.h);
  static final double _buttonBorderRadius = 12;

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.start;
  static const MainAxisAlignment _headerMainAxisAlignment =
      MainAxisAlignment.spaceBetween;
  static const double _fullWidth = double.infinity;

  // Content constants
  static const String _sectionTitle = 'Weekly Earnings';
  static const String _currencySymbol = '\$';
  static const String _quickPayoutButtonText = 'Quick Payout';
  static const String _weekPeriodLabel = 'Week';
  static const String _monthPeriodLabel = 'Month';

  // Menu index constants
  static const int _walletMenuIndex = 5;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Container(
      padding: EdgeInsets.all(_containerPadding),
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: _columnCrossAxisAlignment,
        children: [
          _buildHeader(context, controller),
          SizedBox(height: _headerBottomSpacing),
          _buildChart(controller),
          SizedBox(height: _chartBottomSpacing),
          _buildQuickPayoutButton(context, controller),
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
          offset: _containerShadowOffset,
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, DashboardController controller) {
    return Row(
      mainAxisAlignment: _headerMainAxisAlignment,
      children: [
        _buildTitleSection(context, controller),
        _buildPeriodButtons(),
      ],
    );
  }

  Widget _buildTitleSection(
    BuildContext context,
    DashboardController controller,
  ) {
    return Column(
      crossAxisAlignment: _columnCrossAxisAlignment,
      children: [
        _buildSectionTitle(context),
        SizedBox(height: _headerTitleBottomSpacing),
        _buildTotalEarnings(context, controller),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      _sectionTitle,
      style: TextStyle(
        fontSize: _titleFontSize,
        fontWeight: _titleFontWeight,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildTotalEarnings(
    BuildContext context,
    DashboardController controller,
  ) {
    return Obx(() {
      final totalEarnings = controller.weeklyEarnings
          .map((e) => e.y)
          .reduce((a, b) => a + b);
      return Text(
        '$_currencySymbol${totalEarnings.toStringAsFixed(_totalEarningsDecimalPlaces)}',
        style: TextStyle(
          fontSize: _totalEarningsFontSize,
          fontWeight: _totalEarningsFontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    });
  }

  Widget _buildPeriodButtons() {
    return Row(
      children: [
        _ChartPeriodButton(
          label: _weekPeriodLabel,
          isSelected: true,
          onTap: _handleWeekPeriodSelected,
        ),
        SizedBox(width: _periodButtonSpacing),
        _ChartPeriodButton(
          label: _monthPeriodLabel,
          isSelected: false,
          onTap: _handleMonthPeriodSelected,
        ),
      ],
    );
  }

  Widget _buildChart(DashboardController controller) {
    return SizedBox(
      height: _chartHeight,
      child: _SimpleBarChart(data: controller.weeklyEarnings),
    );
  }

  Widget _buildQuickPayoutButton(
    BuildContext context,
    DashboardController controller,
  ) {
    return SizedBox(
      width: _fullWidth,
      child: ElevatedButton.icon(
        onPressed: () => controller.selectMenuItem(_walletMenuIndex),
        icon: Icon(Icons.account_balance_wallet_rounded, size: _buttonIconSize),
        label: Text(
          _quickPayoutButtonText,
          style: TextStyle(
            fontSize: _buttonFontSize,
            fontWeight: _buttonFontWeight,
          ),
        ),
        style: _buildButtonStyle(context),
      ),
    );
  }

  ButtonStyle _buildButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      padding: _buttonPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_buttonBorderRadius),
      ),
    );
  }

  void _handleWeekPeriodSelected() {
    // Handle week period selection
  }

  void _handleMonthPeriodSelected() {
    // Handle month period selection
  }
}

class _ChartPeriodButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChartPeriodButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  // Button styling constants
  static final double _buttonBorderRadius = 8.r;
  static final EdgeInsets _buttonPadding = EdgeInsets.symmetric(
    horizontal: 12.w,
    vertical: 6.h,
  );
  static final double _buttonBorderWidth = 1.0;
  static const double _borderOpacity = 0.3;
  static const double _textOpacity = 0.7;

  // Text styling constants
  static final double _buttonFontSize = 12.sp;
  static const FontWeight _buttonFontWeight = FontWeight.w600;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_buttonBorderRadius),
        child: Container(
          padding: _buttonPadding,
          decoration: _buildButtonDecoration(context),
          child: _buildButtonText(context),
        ),
      ),
    );
  }

  BoxDecoration _buildButtonDecoration(BuildContext context) {
    return BoxDecoration(
      color: isSelected
          ? Theme.of(context).colorScheme.primaryContainer
          : Colors.transparent,
      borderRadius: BorderRadius.circular(_buttonBorderRadius),
      border: Border.all(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.outline.withOpacity(_borderOpacity),
        width: _buttonBorderWidth,
      ),
    );
  }

  Widget _buildButtonText(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: _buttonFontSize,
        fontWeight: _buttonFontWeight,
        color: isSelected
            ? Theme.of(context).colorScheme.onPrimaryContainer
            : Theme.of(context).colorScheme.onSurface.withOpacity(_textOpacity),
      ),
    );
  }
}

class _SimpleBarChart extends StatelessWidget {
  final List<ChartData> data;

  const _SimpleBarChart({required this.data});

  // Chart layout constants
  static final double _maxChartHeight = 160;
  static final double _barWidth = 32;
  static final double _barBorderRadius = 4.r;
  static final double _valueLabelSpacing = 8;
  static final double _dayLabelSpacing = 8;

  // Text styling constants
  static final double _valueFontSize = 10;
  static const FontWeight _valueFontWeight = FontWeight.w500;
  static final double _dayFontSize = 11;
  static const FontWeight _dayFontWeight = FontWeight.w500;
  static const double _valueTextOpacity = 0.7;
  static const double _dayTextOpacity = 0.6;
  static const double _gradientEndOpacity = 0.7;

  // Format constants
  static const String _currencySymbol = '\$';

  // Layout constants
  static const CrossAxisAlignment _columnCrossAxisAlignment =
      CrossAxisAlignment.end;
  static const MainAxisAlignment _columnMainAxisAlignment =
      MainAxisAlignment.end;
  static const MainAxisAlignment _rowMainAxisAlignment =
      MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    final maxValue = data.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    return Row(
      crossAxisAlignment: _columnCrossAxisAlignment,
      mainAxisAlignment: _rowMainAxisAlignment,
      children: data
          .map((item) => _buildBarColumn(context, item, maxValue))
          .toList(),
    );
  }

  Widget _buildBarColumn(
    BuildContext context,
    ChartData item,
    double maxValue,
  ) {
    final height = (item.y / maxValue) * _maxChartHeight;

    return Column(
      mainAxisAlignment: _columnMainAxisAlignment,
      children: [
        _buildValueLabel(context, item),
        SizedBox(height: _valueLabelSpacing),
        _buildBar(context, height),
        SizedBox(height: _dayLabelSpacing),
        _buildDayLabel(context, item),
      ],
    );
  }

  Widget _buildValueLabel(BuildContext context, ChartData item) {
    return Text(
      '$_currencySymbol${item.y.toInt()}',
      style: TextStyle(
        fontSize: _valueFontSize,
        fontWeight: _valueFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_valueTextOpacity),
      ),
    );
  }

  Widget _buildBar(BuildContext context, double height) {
    return Container(
      width: _barWidth,
      height: height,
      decoration: BoxDecoration(
        gradient: _buildBarGradient(context),
        borderRadius: BorderRadius.circular(_barBorderRadius),
      ),
    );
  }

  LinearGradient _buildBarGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.primary.withOpacity(_gradientEndOpacity),
      ],
    );
  }

  Widget _buildDayLabel(BuildContext context, ChartData item) {
    return Text(
      item.x,
      style: TextStyle(
        fontSize: _dayFontSize,
        fontWeight: _dayFontWeight,
        color: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(_dayTextOpacity),
      ),
    );
  }
}
