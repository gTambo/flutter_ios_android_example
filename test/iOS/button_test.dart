import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ios_android_example/platform_widgets/iOS/button.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateNiceMocks([MockSpec<Dog>()])
import 'button_test.mocks.dart';

Function someCallback<String>() {
  return () => "called back.";
}

class Dog {
  String sound() => "bark";
}

void main() {
  var dog = MockDog();
  group('Button', () {
    testWidgets('capitalizes input', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: IOSButton(onPressed: () {}, label: 'capitalize me')));
      expect(find.text('CAPITALIZE ME'), findsOneWidget);
      expect(find.text('capitalize me'), findsNothing);
    });
    testWidgets('runs callback function when pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(home: IOSButton(onPressed: dog.sound, label: 'dog')));
      var dogBtn = find.text('DOG');
      await tester.tap(dogBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      verify(dog.sound()).called(1);
    });
  });
}
