import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/dependency/app_binding.dart';
import 'routes/app_routes.dart';
import 'utils/app_theme.dart';

class MobileAssessmentApp extends StatelessWidget {
  const MobileAssessmentApp({Key? key, this.isDebug = true}) : super(key: key);
  final bool isDebug;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: isDebug,
      darkTheme: AppTheme.darkTheme(),
      theme: AppTheme.lightTheme(),
      themeMode: ThemeMode.system,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    );
  }
}
