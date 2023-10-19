import 'package:mobile_assessment/core/controllers/employee_controller.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:test/test.dart';

void main() {
  final controller = EmployeeController();

  // Define a sample list of employees.
  final employees = [
    Employee(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      designation: 'Tech',
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

  test('Test employee filtering by name', () {

    // Define the search text and filter criteria for "Name"
    const searchText = 'Jo';
    const filterBy = 'Name';

    final filteredEmployees = controller.filterEmployees(employees, searchText, filterBy);

    // Assertions to check if filtering works as expected.
    expect(filteredEmployees, hasLength(2));
    expect(filteredEmployees[0].firstName, equals('John'));
    expect(filteredEmployees[0].lastName, equals('Doe'));
  });

  test('Test employee filtering by designation', () {

    const searchText = 'Engi';
    const filterBy = 'Designation';

    final filteredEmployees = controller.filterEmployees(employees, searchText, filterBy);

    // Assertions to check if filtering works as expected.
    expect(filteredEmployees, hasLength(1));
    expect(filteredEmployees[0].firstName, equals('Joh'));
    expect(filteredEmployees[0].lastName, equals('Don'));
  });

test('Test employee filtering by designation', () {

    const searchText = '2';
    const filterBy = 'Level';

    final filteredEmployees = controller.filterEmployees(employees, searchText, filterBy);

    // Assertions to check if filtering works as expected.
    expect(filteredEmployees, hasLength(2));
    expect(filteredEmployees[1].firstName, equals('Joh'));
    expect(filteredEmployees[1].lastName, equals('Don'));
  });

}
