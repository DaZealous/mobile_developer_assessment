import 'package:get/get.dart';
import 'package:mobile_assessment/ui/views/home/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
