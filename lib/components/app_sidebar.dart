import 'package:flutter/material.dart';
import 'package:rentoshare/routes/app_router.dart';

class AppSidebar extends StatefulWidget {
  final double iconsOnlyWidth;
  final double width;

  const AppSidebar({super.key, this.iconsOnlyWidth = 60.0, this.width = 135.0});

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar>
    with SingleTickerProviderStateMixin {
  // Style configs and values for the sidebar reference it if you are maintaining the app

  // final _closeIconSize = 32.0;
  // final _dividerHeight = 1.0;
  // final _dividerOpacity = 0.5;

  // final _iconSize = 20.0;
  // final _labelSize = 16.0;

  // final _hoverColor = Colors.grey.shade700;
  // final _focusColor = Colors.grey.shade700;

  // State
  var iconsOnlyMode = true;
  var sideBarWidth = 300.0;

  // animation controllers and
  late AnimationController _widthAnimationcontroller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _widthAnimationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _widthAnimation = Tween(begin: widget.iconsOnlyWidth, end: widget.width)
        .animate(
          CurvedAnimation(
            parent: _widthAnimationcontroller,
            curve: Curves.easeInOut,
          ),
        );
  }

  void updateSideBarWidth() {
    if (iconsOnlyMode) {
      _widthAnimationcontroller.reverse();
    } else {
      _widthAnimationcontroller.forward();
    }
  }

  void toggleIconsOnlyMode() {
    setState(() {
      iconsOnlyMode = !iconsOnlyMode;
      updateSideBarWidth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) {
        return Container(
          width: _widthAnimation.value,
          height: double.infinity,
          color: const Color.fromARGB(255, 23, 22, 22),
          child: _buildSideBar(),
        );
      },
    );
  }

  Widget _buildSideBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildToggleButton(),
        Divider(height: 1),
        Expanded(
          child: Column(
            children: AppSidebarItemData.bodyItems
                .map((item) => _buildItem(item))
                .toList(),
          ),
        ),
        Divider(height: 1),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...AppSidebarItemData.footerItems.map((item) => _buildItem(item)),
            Text(
              'Made by Utsav',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleButton() {
    return Tooltip(
      message: iconsOnlyMode ? 'Expand sidebar' : 'Collapse sidebar',
      waitDuration: const Duration(seconds: 3),

      child: IconButton(
        icon: Icon(
          iconsOnlyMode ? Icons.chevron_right : Icons.chevron_left,
          size: 42,
        ),
        onPressed: () {
          toggleIconsOnlyMode();
        },
      ),
    );
  }

  Widget _buildItem(AppSidebarItem item) {
    final showFullItem = _widthAnimation.value > widget.iconsOnlyWidth + 50;

    return InkWell(
      hoverColor: Colors.grey.shade700,
      focusColor: Colors.grey.shade700,
      borderRadius: BorderRadius.circular(8.0),
      onTap: () => {AppRouter.to(item.route)},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: showFullItem ? _buildFullItem(item) : _buildIconOnlyItem(item),
      ),
    );
  }

  Widget _buildIconOnlyItem(AppSidebarItem item) {
    return Tooltip(
      message: item.tooltip,
      waitDuration: item.tooltipDuration,
      child: Icon(item.icon),
    );
  }

  Widget _buildFullItem(AppSidebarItem item) {
    return Tooltip(
      message: item.tooltip,
      waitDuration: item.tooltipDuration,
      child: Row(
        children: [
          Icon(item.icon),
          const SizedBox(width: 8.0),
          Text(item.label),
        ],
      ),
    );
  }
}

class AppSidebarItemData {
  static List<AppSidebarItem> bodyItems = [
    AppSidebarItem(
      'Home',
      const Duration(seconds: 1),
      AppRoutes.HOME,
      icon: Icons.home,
      label: 'Home',
    ),
    AppSidebarItem(
      'Dashboard',
      const Duration(seconds: 1),
      AppRoutes.DASHBOARD,
      icon: Icons.dashboard,
      label: 'Dashboard',
    ),
  ];

  static List<AppSidebarItem> footerItems = [
    AppSidebarItem(
      'Help',
      const Duration(seconds: 1),
      AppRoutes.HELP,
      icon: Icons.help_outline,
      label: 'Help',
    ),
    AppSidebarItem(
      'Logout',
      const Duration(seconds: 1),
      AppRoutes.LOGOUT,
      icon: Icons.logout,
      label: 'Logout',
    ),
  ];
}

class AppSidebarItem {
  final IconData icon;
  final String label;

  //tooltip configs
  final String tooltip;
  final Duration tooltipDuration;

  // click and routing configs
  final String route;

  AppSidebarItem(
    this.tooltip,
    this.tooltipDuration,
    this.route, {
    required this.icon,
    required this.label,
  });
}
