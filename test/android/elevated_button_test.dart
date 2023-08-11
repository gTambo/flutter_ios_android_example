import 'package:flutter/material.dart';
import 'package:ios_android_example/platform_widgets/android/elevated_button.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'elevated_button_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dog>()])
class Dog {
  String sound() => "bark";
}

void main() {
  var testDog = MockDog();
  group('Button', () {
    testWidgets('capitalizes input', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home:
              AndroidElevatedButton(onPressed: () {}, label: 'capitalize me')));
      expect(find.text('CAPITALIZE ME'), findsOneWidget);
      expect(find.text('capitalize me'), findsNothing);
    });
    testWidgets('runs callback function when pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: AndroidElevatedButton(onPressed: testDog.sound, label: 'dog')));
      var dogBtn = find.text('DOG');
      await tester.tap(dogBtn);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      verify(testDog.sound()).called(1);
    });
  });
}
