import 'package:flutter/material.dart';
import '../routes/app_router.dart';
import '../routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AppRouter.to(AppRoutes.HOME),
          child: const Text("Go to Homepage"),
        ),
      ),
    );
  }
}
