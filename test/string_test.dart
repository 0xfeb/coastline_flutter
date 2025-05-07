import 'package:flutter_test/flutter_test.dart';

import '../lib/structure/string_extra.dart';

void main() {
  group('StringExtra extension tests', () {
    test('apartBy should split string from the left', () {
      expect('hello_world'.apartBy('_'), equals(('hello', 'world')));
      expect(
          'hello_world_again'.apartBy('_'), equals(('hello', 'world_again')));
      expect('hello'.apartBy('_'), equals((null, 'hello')));
    });

    test('apartReverseBy should split string from the right', () {
      expect('hello_world'.apartReverseBy('_'), equals(('hello', 'world')));
      expect('hello_world_again'.apartReverseBy('_'),
          equals(('hello_world', 'again')));
      expect('hello'.apartReverseBy('_'), equals((null, 'hello')));
    });

    test('fileExists should check if file exists', () {
      expect('H:\\s.py'.fileExists, isTrue);
      expect('H:\\s2.py'.fileExists, isFalse);
    });
  });

  group('CStr extension tests', () {
    test('operator - should remove substring', () {
      expect('hello_world' - '_', equals('helloworld'));
      expect('hello_world' - 'o', equals('hell_wrld'));
    });

    test('isMatch should check if string matches regex', () {
      expect('hello_world'.isMatch(r'hello'), isTrue);
      expect('hello_world'.isMatch(r'world'), isTrue);
      expect('hello_world'.isMatch(r'earth'), isFalse);
    });

    test('allMatchs should return all matches of regex', () {
      expect('hello_world'.allMatchs(r'o').map((v) => v.start), equals([4, 7]));
      expect(
          'hello_world'.allMatchs(r'l').map((v) => v.start), equals([2, 3, 9]));
    });

    test('firstMatch should return first match of regex', () {
      expect('hello_world'.firstMatch(r'o')!.start, equals(4));
      expect('hello_world'.firstMatch(r'l')!.start, equals(2));
    });

    test('splitLeft should split string from the left', () {
      expect('hello_world'.splitLeft('_'), equals(('hello', 'world')));
      expect(
          'hello_world_again'.splitLeft('_'), equals(('hello', 'world_again')));
      expect('hello'.splitLeft('_'), equals((null, 'hello')));
    });

    test('splitRight should split string from the right', () {
      expect('hello_world'.splitRight('_'), equals(('hello', 'world')));
      expect('hello_world_again'.splitRight('_'),
          equals(('hello_world', 'again')));
      expect('hello'.splitRight('_'), equals((null, 'hello')));
    });

    test('trimStringLeft should trim substring from the left', () {
      expect('hello_world'.trimStringLeft('hello'), equals('_world'));
      expect('hello_world'.trimStringLeft('he'), equals('llo_world'));
      expect('hello_world'.trimStringLeft('world'), equals('hello_world'));
    });

    test('trimStringRight should trim substring from the right', () {
      expect('hello_world'.trimStringRight('world'), equals('hello_'));
      expect('hello_world'.trimStringRight('ld'), equals('hello_wor'));
      expect('hello_world'.trimStringRight('hello'), equals('hello_world'));
    });

    test('combine should combine strings with gap and tail', () {
      expect('hello_'.combine('_', 'world'), equals('hello_world'));
      expect('hello'.combine('_', 'world'), equals('hello_world'));
    });
  });
}
