import 'package:ios_android_example/counter.dart';
import 'package:test/test.dart';

void main() {
  test('Counter should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}
