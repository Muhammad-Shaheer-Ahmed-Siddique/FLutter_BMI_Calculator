import 'package:FLutter_BMI_Calculator/main.dart' show TodoApp;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BMI calculator shows error when fields are empty', (
    WidgetTester tester,
  ) async {
    // ✅ Wahi widget jo runApp() me hai
    await tester.pumpWidget(TodoApp());

    // ✅ Calculate button press (fields empty hain)
    await tester.tap(find.text('Calculate'));

    // ✅ UI rebuild hone do
    await tester.pump();

    // ✅ Error text verify
    expect(find.text('Please fill all the required fields'), findsOneWidget);
  });
}
