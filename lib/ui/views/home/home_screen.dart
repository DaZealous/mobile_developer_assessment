import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/ui/widgets/app_yextfield.dart';
import 'package:mobile_assessment/ui/widgets/employee_item.dart';
import 'home_screen_controller.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Center(
            child: CustomTextField(
          hintText: 'Search by name, level',
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: controller.obx(
          (employees) => ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              Employee employee = employees![index];
              return EmployeeItem(employee);
            },
            itemCount: employees!.length,
          ),
          // onLoading: buildTransactionLoader(10),
          onError: _buildErrorWidget,
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String? error) {
    return Column(
      children: [
        Text(
          '${error ?? ''}\nClick to refresh',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
