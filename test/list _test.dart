import 'package:flutter_test/flutter_test.dart';

import '../lib/structure/list_extra.dart';

void main() {
  group('ListExtra extension tests', () {
    test('mixList - both lists are empty', () {
      final list1 = <int>[];
      final list2 = <int>[];
      expect(list1.mixList(list2), []);
    });

    test('mixList - one list is empty', () {
      final list1 = [1, 2, 3];
      final list2 = <int>[];
      expect(list1.mixList(list2), [1, 2, 3]);
    });

    test('mixList - both lists are non-empty', () {
      final list1 = [1, 3, 5];
      final list2 = [2, 4, 6];
      expect(list1.mixList(list2), [1, 2, 3, 4, 5, 6]);
    });

    test('mixItem - around is false', () {
      final list = [1, 2, 3];
      expect(list.mixItem(0), [1, 0, 2, 0, 3]);
    });

    test('mixItem - around is true', () {
      final list = [1, 2, 3];
      expect(list.mixItem(0, around: true), [0, 1, 0, 2, 0, 3, 0]);
    });

    test('randomItem - list is empty', () {
      final list = <int>[];
      expect(list.randomItem, isNull);
    });

    test('randomItem - list is non-empty', () {
      final list = [1, 2, 3];
      expect(list.randomItem, anyOf(1, 2, 3));
    });

    test('isEqualTo - lists are equal', () {
      final list1 = [1, 2, 3];
      final list2 = [1, 2, 3];
      expect(list1.isEqualTo(list2), isTrue);
    });

    test('isEqualTo - lists are not equal', () {
      final list1 = [1, 2, 3];
      final list2 = [1, 2, 4];
      expect(list1.isEqualTo(list2), isFalse);
    });

    test('startWith - list starts with another list', () {
      final list1 = [1, 2, 3, 4];
      final list2 = [1, 2];
      expect(list1.startWith(list2, compare: (a, b) => a == b), isTrue);
    });

    test('startWith - list does not start with another list', () {
      final list1 = [1, 2, 3, 4];
      final list2 = [2, 3];
      expect(list1.startWith(list2, compare: (a, b) => a == b), isFalse);
    });

    test('endWith - list ends with another list', () {
      final list1 = [1, 2, 3, 4];
      final list2 = [3, 4];
      expect(list1.endWith(list2, compare: (a, b) => a == b), isTrue);
    });

    test('endWith - list does not end with another list', () {
      final list1 = [1, 2, 3, 4];
      final list2 = [2, 3];
      expect(list1.endWith(list2, compare: (a, b) => a == b), isFalse);
    });

    test('indicate - get indexed list', () {
      final list = [1, 2, 3];
      List<MapEntry<int, int>> l1 = list.indicate.toList();
      List<MapEntry<int, int>> l2 = [
        MapEntry(0, 1),
        MapEntry(1, 2),
        MapEntry(2, 3)
      ];
      expect(l1.equalTo(l2), isTrue);
    });

    test('find - list contains the sublist', () {
      final list = [1, 2, 3, 4, 5];
      final sublist = [2, 3, 4];
      expect(list.find(sublist), 1);
    });

    test('find - list does not contain the sublist', () {
      final list = [1, 2, 3, 4, 5];
      final sublist = [3, 4, 6];
      expect(list.find(sublist), isNull);
    });

    test('findLast - list contains the sublist', () {
      final list = [1, 2, 3, 4, 5, 2, 3, 4];
      final sublist = [2, 3, 4];
      expect(list.findLast(sublist), 5);
    });

    test('findLast - list does not contain the sublist', () {
      final list = [1, 2, 3, 4, 5];
      final sublist = [3, 4, 6];
      expect(list.findLast(sublist), isNull);
    });

    test('compare - lists are equal', () {
      final list1 = [1, 2, 3];
      final list2 = [1, 2, 3];
      expect(list1.compare(list2), isTrue);
    });

    test('compare - lists are not equal', () {
      final list1 = [1, 2, 3];
      final list2 = [1, 2, 4];
      expect(list1.compare(list2), isFalse);
    });
  });

  group('inc function tests', () {
    test('inc - default start value', () {
      expect(inc(length: 3), [0, 1, 2]);
    });

    test('inc - custom start value', () {
      expect(inc(start: 5, length: 3), [5, 6, 7]);
    });
  });
}
