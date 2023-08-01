import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_android_example/main.dart';
import 'package:ios_android_example/screens/text_page.dart';

void main() {
  group('Text page tests', () {
    testWidgets('Shows the expected TextField widget',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());
      // await tester.pumpAndSettle();
      // expect(find.byType(Column), findsOneWidget);
      // expect(find.text('Enter text below.'), findsOneWidget);
      // expect(find.byType(TextField), findsOneWidget);
      expect(find.byKey(const Key('android_text_field_0')), findsOneWidget);
    });
    testWidgets('Typing in text input displays on page',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.enterText(find.byType(TextField), 'Hello');
      expect(find.text('Hello'), findsWidgets);
    });
    testWidgets('Pressing "next" button navigates away',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      var nxtBtn = find.text('NEXT');
      expect(nxtBtn, findsOneWidget);
      await tester.tap(nxtBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byKey(const Key('android_text_field_0')), findsNothing);
    });
  });
}
