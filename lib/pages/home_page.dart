import 'package:flutter/material.dart';
import 'package:rentoshare/app_utils/notifier.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Notifier.showToast(
            "Sorry THe Login page is not ready yet",
            type: ToastType.warning,
          ),
          child: const Text("Go to Login"),
        ),
      ),
    );
  }
}
