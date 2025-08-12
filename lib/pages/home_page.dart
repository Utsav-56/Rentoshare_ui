import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentoshare/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "RentoShare Home",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.DASHBOARD);
              },
              child: const Text("Go to Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
