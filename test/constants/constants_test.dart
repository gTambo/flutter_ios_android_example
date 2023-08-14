import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_android_example/constants/constants.dart';

void main() {
  const pageOne = Scaffold(
    body: Text('page 1'),
  );
  const pageTwo = Scaffold(
    body: Text('page 2'),
  );
  testWidgets('Next page function navigates to new page',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: pageOne,
        routes: {
          '/page-2': (context) => pageTwo,
        },
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('page 1'), findsOneWidget);

    final BuildContext context = tester.element(find.byType(Scaffold));

    nextPage(context, pageTwo);

    await tester.pumpAndSettle();

    expect(find.text('page 1'), findsNothing);
    expect(find.text('page 2'), findsOneWidget);
  });
}
