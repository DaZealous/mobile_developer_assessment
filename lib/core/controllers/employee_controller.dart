import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/models/employee.dart';

class EmployeeController extends GetxController {
  Color getEmploymentStatusColor(int level, double productivityScore) {
    if (level == 0) {
      if (productivityScore >= 80.0) {
        return Colors.green;
      } else if (productivityScore <= 39.0) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    } else if (level == 5 && productivityScore >= 80.0) {
      return Colors.grey;
    } else {
      // For levels 1 to 5
      if (productivityScore >= 80.0) {
        return Colors.green;
      } else if (productivityScore >= 50.0) {
        return Colors.grey;
      } else if (productivityScore >= 40.0) {
        return Colors.brown;
      } else {
        return Colors.red;
      }
    }
  }

  String getEmploymentStatus(int level, double productivityScore) {
    /// Check if the employee's level is 0
    /// Level 0 employees cannot be demoted, only terminated if need be
    if (level == 0) {
      if (productivityScore >= 80.0) {
        return 'Promoted';
      } else if (productivityScore <= 39.0) {
        return 'Terminated';
      } else {
        return 'No Change';
      }
    }
    /// because the highest level is 5, there is no need promoting an employee
    /// that has a productivity score greater than 79
    else if (level == 5 && productivityScore >= 80.0) {
      return 'No Change';
    } else {
      // For levels 1 to 5
      if (productivityScore >= 80.0) {
        return 'Promoted';
      } else if (productivityScore >= 50.0) {
        return 'No Change';
      } else if (productivityScore >= 40.0) {
        return 'Demoted';
      } else {
        return 'Terminated';
      }
    }
  }

  String calculateNewSalary(int level) {
    switch (level) {
      case 0:
        return "70,000";
      case 1:
        return "100,000";
      case 2:
        return "120,000";
      case 3:
        return "180,000";
      case 4:
        return "200,000";
      case 5:
        return "250,000";
      default:
        return "Salary not specified";
    }
  }

  List<Employee> filterEmployees(
    List<Employee> employees,
    String searchText,
    String filterBy,
  ) {

    final normalizedSearchText = searchText.toLowerCase();

    return employees.where((employee) {
      /// Check if the employee's name, designation, or level contains the search text
      /// the time complexity for this iteration is O(n * m), where "n" is the number of employees in the list and "m" is the length of the longest string involved in the filtering operation.
      if (filterBy == "Name") {
        final fullName =
            "${employee.firstName} ${employee.lastName}".toLowerCase();
        return fullName.contains(normalizedSearchText);
      } else if (filterBy == "Designation") {
        final normalizedDesignation = employee.designation!.toLowerCase();
        return normalizedDesignation.contains(normalizedSearchText);
      } else if (filterBy == "Level") {
        final level = employee.level.toString();
        return level.contains(normalizedSearchText);
      }
      return false;
    }).toList();
  }

  bool isPromoted(double productivityScore, int level) {
    return level < 5 && productivityScore >= 80.0;
  }

  bool isDemoted(double productivityScore, int level) {
    return level > 0 && (productivityScore >= 40 && productivityScore <= 49);
  }

  String getActiveStatus(int? employmentStatus) {
    if (employmentStatus == 1) {
      return 'Active';
    } else {
      return 'InActive';
    }
  }
}
