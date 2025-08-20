import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/controllers/app_navigation_controller.dart';

// Use the unified NavigationController instead of DashboardNavController
typedef DashboardNavController = AppNavigationController;

class DashboardController extends GetxController {
  // Observable variables
  var selectedMenuIndex = 0.obs;
  var userName = 'John Doe'.obs;
  var activeListings = 12.obs;
  var pendingRequests = 3.obs;
  var activeRentals = 5.obs;
  var walletBalance = 1250.50.obs;
  var isLoading = false.obs;

  // Dashboard menu items
  final List<DashboardMenuItem> menuItems = [
    DashboardMenuItem(
      index: 0,
      title: 'Overview',
      icon: 'home',
      route: '/dashboard/overview',
    ),
    DashboardMenuItem(
      index: 1,
      title: 'My Listings',
      icon: 'list',
      route: '/dashboard/listings',
    ),
    DashboardMenuItem(
      index: 2,
      title: 'My Rentals',
      icon: 'shopping_bag',
      route: '/dashboard/rentals',
    ),
    DashboardMenuItem(
      index: 3,
      title: 'Messages',
      icon: 'message',
      route: '/dashboard/messages',
    ),
    DashboardMenuItem(
      index: 4,
      title: 'Reviews',
      icon: 'star',
      route: '/dashboard/reviews',
    ),
    DashboardMenuItem(
      index: 5,
      title: 'Wallet',
      icon: 'account_balance_wallet',
      route: '/dashboard/wallet',
    ),
    DashboardMenuItem(
      index: 6,
      title: 'Settings',
      icon: 'settings',
      route: '/dashboard/settings',
    ),
  ];

  // Recent activities mock data
  var recentActivities = <ActivityItem>[
    ActivityItem(
      type: ActivityType.message,
      title: 'New message from Sarah',
      subtitle: 'About iPhone 13 rental',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    ActivityItem(
      type: ActivityType.payment,
      title: 'Payment received',
      subtitle: '\$150 for MacBook rental',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ActivityItem(
      type: ActivityType.review,
      title: 'New review received',
      subtitle: '5 stars for Camera rental',
      timestamp: DateTime.now().subtract(const Duration(hours: 4)),
    ),
  ].obs;

  // Chart data for earnings
  var weeklyEarnings = <ChartData>[
    ChartData('Mon', 150),
    ChartData('Tue', 230),
    ChartData('Wed', 180),
    ChartData('Thu', 320),
    ChartData('Fri', 290),
    ChartData('Sat', 410),
    ChartData('Sun', 380),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  void selectMenuItem(int index) {
    selectedMenuIndex.value = index;
  }

  void loadDashboardData() async {
    isLoading.value = true;

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Update data here from API

    isLoading.value = false;
  }

  void refreshData() {
    loadDashboardData();
  }
}

class DashboardMenuItem {
  final int index;
  final String title;
  final String icon;
  final String route;

  DashboardMenuItem({
    required this.index,
    required this.title,
    required this.icon,
    required this.route,
  });
}

class ActivityItem {
  final ActivityType type;
  final String title;
  final String subtitle;
  final DateTime timestamp;

  ActivityItem({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.timestamp,
  });
}

enum ActivityType { message, payment, review, listing, rental }

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
