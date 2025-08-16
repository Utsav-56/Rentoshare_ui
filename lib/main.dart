import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentoshare/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:rentoshare/styles/app_theme.dart';
import 'package:toastification/toastification.dart';

import 'routes/app_routes.dart';
// import '../.bak/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var AppTheme = AppThemeData();

  Size getAdaptiveDesignSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1200) {
      // Desktop
      return const Size(1920, 1200);
    } else if (width >= 800) {
      // Tablet
      return const Size(800, 1280);
    } else {
      // Mobile
      return const Size(375, 812);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1920, 1200), // Default size
      minTextAdapt: true,
      splitScreenMode: true,
      child: ToastificationWrapper(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RentoShare',
          theme: AppTheme.theme,
          darkTheme: AppTheme.theme,
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.DASHBOARD,
          getPages: AppPages.pages,
          builder: (context, child) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
