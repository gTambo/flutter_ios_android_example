import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_android_example/screens/date_page.dart';

void main() {
  group('Date page ', () {
    final today = DateTime.now();
    // .toLocal().toString().split(' ')[0];
    testWidgets('shows today\'s date as dd/mm/yyyy',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: DatePage(),
      ));
      await tester.pumpAndSettle();

      final formattedDate = '${today.month}/${today.day}/${today.year}';
      expect(find.text(formattedDate), findsOneWidget);
    });

    testWidgets('opens Date picker dialog when date button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: DatePage(),
      ));
      final datePicker = find.byType(OutlinedButton);
      expect(datePicker, findsOneWidget);
      await tester.tap(datePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final dateDialog = find.byType(Dialog, skipOffstage: false);
      expect(dateDialog, findsOneWidget);
    });
    testWidgets('selecting a date updates the displayed button text',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: DatePage(),
      ));
      final datePicker = find.byType(OutlinedButton);
      await tester.tap(datePicker);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(find.text('15'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      final formattedDate = '${today.month}/15/${today.year}';
      expect(find.text(formattedDate), findsOneWidget);
    }); // seems brittle...
  });
}
