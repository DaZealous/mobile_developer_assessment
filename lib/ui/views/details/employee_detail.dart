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
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Employment Status',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: controller.getEmploymentStatusColor(
                        employee.level!,
                        employee.productivityScore!,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.getEmploymentStatus(
                        employee.level!,
                        employee.productivityScore!,
                      ),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),

              ///update new salary when employee is promoted
              if (controller.isPromoted(
                  employee.productivityScore!, employee.level!))
                _buildPromotedSalary(context),

              ///update new salary when employee is demoted
              if (controller.isDemoted(
                  employee.productivityScore!, employee.level!))
                _buildDemotedSalary(context),

              const SizedBox(height: 10),
              _buildEmployeeDetailsCard(context)
            ],
          ),
        ),
      ),
    );
  }

  _buildEmployeeDetailsCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardItem('Productivity Score: ',
                  '${employee.productivityScore}', context),
              const SizedBox(
                height: 10,
              ),
              _buildCardItem(
                  'Current Salary: ', '${employee.currentSalary}', context),
              const SizedBox(
                height: 10,
              ),
              _buildCardItem('Current Level: ', '${employee.level}', context),
              const SizedBox(
                height: 10,
              ),
              _buildCardItem(
                  'Status: ',
                  controller.getActiveStatus(employee.employmentStatus),
                  context),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCardItem(String title, String content, context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  _buildDemotedSalary(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildCardItem('New Salary',
            controller.calculateNewSalary(employee.level! - 1), context),
      ],
    );
  }

  _buildPromotedSalary(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildCardItem('New Salary',
            controller.calculateNewSalary(employee.level! + 1), context),
      ],
    );
  }
}
