import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/controllers/employee_controller.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/utils/constants.dart';

class EmployeeDetail extends StatelessWidget {
  EmployeeDetail({super.key});

  final EmployeeController controller = Get.find();
  final Employee employee = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        AppConstants.getInitials(
                            '${employee.firstName} ${employee.lastName}'),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${employee.firstName} ${employee.lastName}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${employee.designation}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ))
                ],
              ),
              Text(
                'Level: ${employee.level}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Details:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Productivity Score: ${employee.productivityScore?.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Current Salary: ${employee.currentSalary}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Employment Status: ${getEmploymentStatusText(employee.employmentStatus)}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getEmploymentStatusText(int? employmentStatus) {
    if (employmentStatus == 1) {
      return 'Active';
    } else {
      return 'Terminated';
    }
  }
}
