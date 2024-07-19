import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import '../lib/structure/value.dart' as j;

void main() {
  test('isEmpty should return true for null values', () {
    expect(j.isEmpty(null), true);
  });

  test('isEmpty should return true for empty String', () {
    expect(j.isEmpty(''), true);
  });

  test('isEmpty should return true for empty List', () {
    expect(j.isEmpty([]), true);
  });

  test('isEmpty should return true for empty Map', () {
    expect(j.isEmpty({}), true);
  });

  test('isEmpty should return true for empty Set', () {
    expect(j.isEmpty(Set()), true);
  });

  test('isEmpty should return true for TextEditingController with empty text',
      () {
    final controller = TextEditingController();
    expect(j.isEmpty(controller), true);
  });

  test('isEmpty should return false for non-empty String', () {
    expect(j.isEmpty('test'), false);
  });

  test('isEmpty should return false for non-empty List', () {
    expect(j.isEmpty([1]), false);
  });

  test('isEmpty should return false for non-empty Map', () {
    expect(j.isEmpty({'key': 'value'}), false);
  });

  test('isEmpty should return false for non-empty Set', () {
    expect(j.isEmpty({1}), false);
  });

  test(
      'isEmpty should return false for TextEditingController with non-empty text',
      () {
    final controller = TextEditingController(text: 'test');
    expect(j.isEmpty(controller), false);
  });

  test('isNotEmpty should return false for null values', () {
    expect(j.isNotEmpty(null), false);
  });

  test('isNotEmpty should return false for empty String', () {
    expect(j.isNotEmpty(''), false);
  });

  test('isNotEmpty should return false for empty List', () {
    expect(j.isNotEmpty([]), false);
  });

  test('isNotEmpty should return false for empty Map', () {
    expect(j.isNotEmpty({}), false);
  });

  test('isNotEmpty should return false for empty Set', () {
    expect(j.isNotEmpty(Set()), false);
  });

  test(
      'isNotEmpty should return false for TextEditingController with empty text',
      () {
    final controller = TextEditingController();
    expect(j.isNotEmpty(controller), false);
  });

  test('isNotEmpty should return true for non-empty String', () {
    expect(j.isNotEmpty('test'), true);
  });

  test('isNotEmpty should return true for non-empty List', () {
    expect(j.isNotEmpty([1]), true);
  });

  test('isNotEmpty should return true for non-empty Map', () {
    expect(j.isNotEmpty({'key': 'value'}), true);
  });

  test('isNotEmpty should return true for non-empty Set', () {
    expect(j.isNotEmpty({1}), true);
  });

  test(
      'isNotEmpty should return true for TextEditingController with non-empty text',
      () {
    final controller = TextEditingController(text: 'test');
    expect(j.isNotEmpty(controller), true);
  });

  test('len should return 0 for null values', () {
    expect(j.len(null), 0);
  });

  test('len should return 0 for empty String', () {
    expect(j.len(''), 0);
  });

  test('len should return 0 for empty List', () {
    expect(j.len([]), 0);
  });

  test('len should return 0 for empty Map', () {
    expect(j.len({}), 0);
  });

  test('len should return 0 for empty Set', () {
    expect(j.len(Set()), 0);
  });

  test('len should return 0 for TextEditingController with empty text', () {
    final controller = TextEditingController();
    expect(j.len(controller), 0);
  });

  test('len should return length of non-empty String', () {
    expect(j.len('test'), 4);
  });

  test('len should return length of non-empty List', () {
    expect(j.len([1, 2, 3]), 3);
  });

  test('len should return length of non-empty Map', () {
    expect(j.len({'key1': 'value1', 'key2': 'value2'}), 2);
  });

  test('len should return length of non-empty Set', () {
    expect(j.len({1, 2, 3}), 3);
  });

  test('len should return length of TextEditingController with non-empty text',
      () {
    final controller = TextEditingController(text: 'test');
    expect(j.len(controller), 4);
  });

  test('len should return 1 for int', () {
    expect(j.len(1), 1);
  });
}
