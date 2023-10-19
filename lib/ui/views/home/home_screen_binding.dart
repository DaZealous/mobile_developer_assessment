import 'package:get/get.dart';
import 'package:mobile_assessment/ui/views/home/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }

}
