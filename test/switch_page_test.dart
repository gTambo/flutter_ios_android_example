import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_android_example/screens/switch_page.dart';

void main() {
  group('Switch page', () {
    testWidgets('shows switch widgets', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: SwitchPage(),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Switch), findsWidgets);
    });
    testWidgets('switch toggles when clicked', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: SwitchPage(),
      ));
      await tester.pumpAndSettle();
      final switchWidget = find.byType(Switch).first;
      await tester.tap(switchWidget);
      await tester.pumpAndSettle();
      expect(find.text('Switch 1: true'), findsOneWidget);

      // Tap the switch again to toggle its state back
      await tester.tap(switchWidget);
      await tester.pumpAndSettle(); // Wait for animations to complete

      // Verify the reverted state text
      expect(find.text('Switch 1: false'), findsOneWidget);
    });
  });
}
