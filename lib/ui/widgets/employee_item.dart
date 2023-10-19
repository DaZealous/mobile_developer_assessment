import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/routes/app_routes.dart';
import 'package:mobile_assessment/utils/constants.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem(this.employee, {super.key});

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      color: Theme.of(context).cardTheme.color,
      child: InkWell(
        onTap: (){
          Get.toNamed(AppRoutes.employeeDetail, arguments: employee);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    AppConstants.getInitials('${employee.firstName} ${employee.lastName}'),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${employee.firstName} ${employee.lastName}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(employee.designation!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
