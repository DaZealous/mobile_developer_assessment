import 'package:get/get.dart';
import 'package:mobile_assessment/core/models/employee.dart';

class EmployeeController extends GetxController{

  List<Employee> filterEmployees(
      List<Employee> employees,
      String searchText,
      String filterBy,
      ) {

    /// Normalize the search text to lowercase for a case-insensitive search
    final normalizedSearchText = searchText.toLowerCase();

    return employees.where((employee) {
      /// Check if the employee's name, designation, or level contains the search text
      if (filterBy == "Name") {
        final fullName = "${employee.firstName} ${employee.lastName}".toLowerCase();
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

}