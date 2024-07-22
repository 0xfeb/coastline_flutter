import 'package:flutter_test/flutter_test.dart';

import '../lib/structure/map_extra.dart';

void main() {
  group('MapExtra extension', () {
    test('findByValue should return MapEntry if value matches', () {
      final map = {1: 'one', 2: 'two', 3: 'three'};
      final result = map.findByValue<int, String>((value) => value == 'two');
      expect(result, isNotNull);
      expect(result!.key, 2);
      expect(result.value, 'two');
    });

    test('findByValue should return null if no value matches', () {
      final map = {1: 'one', 2: 'two', 3: 'three'};
      final result = map.findByValue<int, String>((value) => value == 'four');
      expect(result, isNull);
    });

    test('find should return MapEntry if both key and value match', () {
      final map = {1: 'one', 2: 'two', 3: 'three'};
      final result = map.find<int, String>(
        key: (key) => key == 2,
        value: (value) => value == 'two',
      );
      expect(result, isNotNull);
      expect(result!.key, 2);
      expect(result.value, 'two');
    });

    test('find should return MapEntry if only key matches', () {
      final map = {1: 'one', 2: 'two', 3: 'three'};
      final result = map.find<int, String>(
        key: (key) => key == 2,
      );
      expect(result, isNotNull);
      expect(result!.key, 2);
      expect(result.value, 'two');
    });

    test('find should return MapEntry if only value matches', () {
      final map = {1: 'one', 2: 'two', 3: 'three'};
      final result = map.find<int, String>(
        value: (value) => value == 'two',
      );
      expect(result, isNotNull);
      expect(result!.key, 2); // First key with matching value
      expect(result.value, 'two');
    });

    test('find should return null if no key or value matches', () {
      final map = {1: 'one', 2: 'two', 3: 'three'};
      final result = map.find<int, String>(
        key: (key) => key == 4,
        value: (value) => value == 'four',
      );
      expect(result, isNull);
    });
  });
}
