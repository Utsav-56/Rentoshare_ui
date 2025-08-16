import 'package:flutter/material.dart';
import 'package:rentoshare/dashboard/widgets/overview/dashboard_overview.dart';
import 'package:rentoshare/dashboard/widgets/listings/my_listings_view.dart';
import 'package:rentoshare/dashboard/widgets/rentals/my_rentals_view.dart';
import 'package:rentoshare/dashboard/widgets/messages/messages_view.dart';
import 'package:rentoshare/dashboard/widgets/reviews/reviews_view.dart';
import 'package:rentoshare/dashboard/widgets/wallet/wallet_view.dart';
import 'package:rentoshare/dashboard/widgets/settings/settings_view.dart';

class DashboardContent extends StatelessWidget {
  final int selectedIndex;

  const DashboardContent({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return const DashboardOverview();
      case 1:
        return const MyListingsView();
      case 2:
        return const MyRentalsView();
      case 3:
        return const MessagesView();
      case 4:
        return const ReviewsView();
      case 5:
        return const WalletView();
      case 6:
        return const SettingsView();
      default:
        return const DashboardOverview();
    }
  }
}
