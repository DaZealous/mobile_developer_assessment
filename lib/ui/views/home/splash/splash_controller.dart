import 'package:get/get.dart';
import 'package:mobile_assessment/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _performRouting();
    super.onReady();
  }

  /// this function waits for 2 seconds before routing to
  /// the home page screen
  void _performRouting() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.homeScreen);
    });
  }
}
