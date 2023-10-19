import 'package:get/get.dart';
import 'package:mobile_assessment/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _performRouting();
    super.onReady();
  }

  /// the function waits for 2 seconds before routing to
  /// the home page screen
  void _performRouting() {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      Get.toNamed(AppRoutes.splashScreen);
    });
  }
}
