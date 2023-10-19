import 'package:get/get.dart';
import 'package:mobile_assessment/core/controllers/employee_controller.dart';

class AppBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeController());
  }

}