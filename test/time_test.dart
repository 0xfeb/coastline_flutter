import 'package:flutter_test/flutter_test.dart';

import '../lib/structure/time.dart';

void main() {
  group('DateTimeExtra', () {
    test('dateTimeString', () {
      expect(DateTime(2023, 10, 15, 12, 30, 45).dateTimeString,
          '2023-10-15 12:30:45');
    });

    test('dateString', () {
      expect(DateTime(2023, 10, 15).dateString, '2023-10-15');
    });

    test('timeString', () {
      expect(DateTime(2023, 10, 15, 12, 30, 45).timeString, '12:30:45');
    });

    test('simpleString', () {
      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime yesterday = today.subtract(Duration(days: 1));
      DateTime dayBeforeYesterday = today.subtract(Duration(days: 2));
      DateTime threeDaysAgo = today.subtract(Duration(days: 3));

      expect(today.simpleString, startsWith('今天'));
      expect(yesterday.simpleString, startsWith('昨天'));
      expect(dayBeforeYesterday.simpleString, startsWith('前天'));
      expect(threeDaysAgo.simpleString, threeDaysAgo.dateTimeString);
    });
  });

  group('DateTimeString', () {
    test('dateTime', () {
      expect(
          '2023-10-15 12:30:45'.dateTime, DateTime(2023, 10, 15, 12, 30, 45));
    });
  });
}
