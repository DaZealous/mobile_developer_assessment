import 'package:get/get.dart';
import 'package:mobile_assessment/core/helpers/api/data.dart';
import 'package:mobile_assessment/core/models/employee.dart';

class HomeScreenController extends GetxController
    with StateMixin<List<Employee>> {
  @override
  void onInit() {
    fetchEmployeeLists();
    super.onInit();
  }

  void fetchEmployeeLists() async {
    change([], status: RxStatus.loading());
    var response = await Future.delayed(const Duration(milliseconds: 3000), () => Api.successResponse);
    if (response['statusCode'] == 200) {
      List data = response['data'] ?? [];
      if(data.isEmpty){
        change([], status: RxStatus.error('No employees found'));
      }else {
        List<Employee> employees = data.map((e) => Employee.fromJson(e)).toList();
        change(employees, status: RxStatus.success());
      }
    } else {
      var error = Api.errorRexponse;
      change([], status: RxStatus.error(error['message'] ?? ''));
    }
  }
}
