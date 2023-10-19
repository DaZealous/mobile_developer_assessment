import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/controllers/employee_controller.dart';
import 'package:mobile_assessment/core/helpers/api/data.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/utils/constants.dart';

class HomeScreenController extends GetxController
    with StateMixin<List<Employee>> {
  RxList<Employee> employees = <Employee>[].obs;
  final EmployeeController employeeController = Get.find();
  RxString filterBy = 'Name'.obs;

  @override
  void onInit() {
    fetchEmployeeLists();
    super.onInit();
  }

  void filterEmployee(String filter) {
    if (filter.isEmpty) {
      change(employees, status: RxStatus.success());
      return;
    }
    change(
        employeeController.filterEmployees(employees, filter, filterBy.value),
        status: RxStatus.success());
  }

  void fetchEmployeeLists() async {
    change([], status: RxStatus.loading());
    if (employees.isNotEmpty) {
      change(employees, status: RxStatus.success());
      return;
    }
    var response = await Future.delayed(
        const Duration(milliseconds: 3000), () => Api.successResponse);
    if (response['statusCode'] == 200) {
      List data = response['data'] ?? [];
      if (data.isEmpty) {
        change([], status: RxStatus.error('No employees found'));
      } else {
        List<Employee> employees =
            data.map((e) => Employee.fromJson(e)).toList();
        this.employees.value = employees;
        change(employees, status: RxStatus.success());
      }
    } else {
      var error = Api.errorRexponse;
      change([], status: RxStatus.error(error['message'] ?? ''));
    }
  }

  void showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: Get.context!,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: List.generate(
        AppConstants.filterKeywords.length,
        (index) {
          String item = AppConstants.filterKeywords[index];
          return PopupMenuItem<String>(
            value: item.toLowerCase(),
            onTap: () {
              filterBy.value = item;
            },
            child: Text(item),
          );
        },
      ),
      elevation: 8.0,
    );
  }
}
