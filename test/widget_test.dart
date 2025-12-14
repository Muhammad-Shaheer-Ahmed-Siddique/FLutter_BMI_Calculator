import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

void main() {
  testWidgets('BMI calculator shows error when fields are empty', (
    WidgetTester tester,
  ) async {
    // Build the app
    await tester.pumpWidget(TodoApp());

    // Tap the calculate button without entering anything
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    // Expect error message
    expect(find.text('Please fill all the required fields'), findsOneWidget);
  });
}
