import 'package:mobile_assessment/core/controllers/employee_controller.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:test/test.dart';

void main() {
  final controller = EmployeeController();

  var employee = Employee(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    designation: 'Engineer',
    level: 2,
    productivityScore: 75.0,
    currentSalary: '120,000',
    employmentStatus: 1,
  );

  test('Employment status test', () {
    String employeeStatus = controller.getEmploymentStatus(
        employee.level!, employee.productivityScore!);

    expect(employeeStatus, 'No Change');
  });

  test('Employee salary test', () {
    String salary = controller.calculateNewSalary(employee.level!);

    expect(salary, '120,000');
  });

  test('Employee demoted test', () {
    bool isDemoted =
        controller.isDemoted(employee.productivityScore!, employee.level!);

    expect(isDemoted, false);
  });

  test('Employee promoted test', () {
    bool isPromoted =
        controller.isPromoted(employee.productivityScore!, employee.level!);

    expect(isPromoted, false);
  });

  test('Employee active status', () {
    String active =
        controller.getActiveStatus(employee.employmentStatus!);

    expect(active, 'Active');
  });
}
