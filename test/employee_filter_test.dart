import 'package:mobile_assessment/core/controllers/employee_controller.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:test/test.dart';

void main() {
  test('Test employee filtering by name', () {
    final controller = EmployeeController(); // Replace 'FilterController' with the actual name of your GetxController.

    // Define a sample list of employees.
    final employees = [
      Employee(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        designation: 'Engineer',
        level: 2,
        productivityScore: 75.0,
        currentSalary: '120,000',
        employmentStatus: 1,
      ),
      Employee(
        id: 1,
        firstName: 'Joh',
        lastName: 'Don',
        designation: 'Engineer',
        level: 2,
        productivityScore: 75.0,
        currentSalary: '120,000',
        employmentStatus: 1,
      ),
    ];

    // Define the search text and filter criterie for "Name"
    final searchText = 'Jo';
    final filterBy = 'Name';

    final filteredEmployees = controller.filterEmployees(employees, searchText, filterBy);

    // Assertions to check if filtering works as expected.
    expect(filteredEmployees, hasLength(2));
    expect(filteredEmployees[0].firstName, equals('John'));
    expect(filteredEmployees[0].lastName, equals('Doe'));
  });

  // Add more test cases for other filter criteria (Designation and Level).
}
