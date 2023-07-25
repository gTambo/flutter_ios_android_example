import 'package:ios_android_example/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    test(
      'Counter should start at 0',
      () => expect(Counter().value, 0),
    );

    test('Counter should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('Counter should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
