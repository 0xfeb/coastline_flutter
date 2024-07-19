import 'package:flutter_test/flutter_test.dart';

import '../lib/structure/number_extra.dart';

void main() {
  group('NumberExtra extension', () {
    test('limitBetween should return the number itself if within range', () {
      expect(5.limitBetween(1, 10), 5);
    });

    test('limitBetween should return the min value if number is below min', () {
      expect(0.limitBetween(1, 10), 1);
    });

    test('limitBetween should return the max value if number is above max', () {
      expect(15.limitBetween(1, 10), 10);
    });

    test('limitBetween should handle null min', () {
      expect(5.limitBetween(null, 10), 5);
      expect(15.limitBetween(null, 10), 10);
    });

    test('limitBetween should handle null max', () {
      expect(5.limitBetween(1, null), 5);
      expect(0.limitBetween(1, null), 1);
    });

    test('limitBetween should handle both min and max as null', () {
      expect(5.limitBetween(null, null), 5);
    });
  });

  group('IntExtra extension', () {
    test('digitsString should return the number as string with leading zeros',
        () {
      expect(5.digitsString(digitNumber: 2), '05');
      expect(123.digitsString(digitNumber: 5), '00123');
    });

    test('digitsString should handle negative numbers', () {
      expect((-5).digitsString(digitNumber: 2), '-05');
      expect((-123).digitsString(digitNumber: 5), '-00123');
    });

    test('digitsString should handle zero', () {
      expect(0.digitsString(digitNumber: 2), '00');
    });

    test(
        'digitsString should handle digitNumber less than the number of digits',
        () {
      expect(12345.digitsString(digitNumber: 3), '12345');
    });
  });
}
