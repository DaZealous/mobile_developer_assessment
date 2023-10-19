// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mobile_assessment/core/models/employee.dart';
import 'package:mobile_assessment/ui/widgets/employee_item.dart';

void main() {

  testWidgets('EmployeeItem Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(
      GetMaterialApp(
        home: EmployeeItem(
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
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Tech'), findsOneWidget);

    // Find the InkWell widget
    final inkWellFinder = find.byType(InkWell);

    // Verify that the InkWell is present
    expect(inkWellFinder, findsOneWidget);

  });
}
