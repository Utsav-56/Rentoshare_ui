import 'package:flutter/material.dart';
import 'package:rentoshare/routes/app_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 20),
            const Text('404 - Page Not Found'),
            const SizedBox(height: 10),
            const Text(
              'The page you are looking for does not exist.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => AppRouter.to(AppRoutes.HOME),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
