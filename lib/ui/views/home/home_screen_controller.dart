import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/controllers/employee_controller.dart';
import 'package:mobile_assessment/core/helpers/api/data.dart';
import 'package:mobile_assessment/core/helpers/database/database_helper.dart';
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
    var result = employeeController.filterEmployees(employees, filter, filterBy.value);
    if (result.isEmpty) {
      var error = Api.errorRexponse;
      var specificError = {};
      List errors = ((error['errors'] ?? []) as List);
      if (errors.isNotEmpty && errors.length >= 2) {
        specificError = errors[1];
      } else {
        specificError = error;
      }
      change([], status: RxStatus.error(specificError['message'] ?? ''));
    } else {
      change(result, status: RxStatus.success());
    }
  }

  void fetchEmployeeLists() async {
    change([], status: RxStatus.loading());

    /// first get employees from database
    employees.value = await getEmployeesFromDatabase();

    if (employees.isNotEmpty) {
      change(employees, status: RxStatus.success());
    }

    /// then get the update employee from the api
    var response = await Future.delayed(
        const Duration(milliseconds: 3000), () => Api.successResponse);
    if (response['statusCode'] == 200) {
      List<Map<String, dynamic>> data = response['data'] ?? [];
      if (data.isEmpty) {
        change([], status: RxStatus.error('No employees found'));
      } else {
        List<Employee> employees =
            data.map((e) => Employee.fromJson(e)).toList();
        this.employees.value = employees;
        saveEmployeesToDatabase(data);
        change(employees, status: RxStatus.success());
      }
    } else {
      var error = Api.errorRexponse;
      change([], status: RxStatus.error(error['message'] ?? ''));
    }
  }

  /// show pop menu for filter [name, designation, and level]

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

  Future<List<Employee>> getEmployeesFromDatabase() async {
    await DatabaseHelper.instance.database;
    final results = await DatabaseHelper.instance.queryAll();
    return results.map((e) => Employee.fromJson(e)).toList();
  }

  saveEmployeesToDatabase(List<Map<String, dynamic>> employees) async {
    await DatabaseHelper.instance.database;
    await DatabaseHelper.instance.insertAll(employees);
  }

  @override
  void dispose() {
    closeDatabase();
    super.dispose();
  }

  void closeDatabase() async {
    await DatabaseHelper.instance.close();
  }
}
