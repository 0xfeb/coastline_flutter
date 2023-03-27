//import 'package:flutter/material.dart';

import 'dart:io';

import 'combo_data.dart';

extension StringExtra on String {
  /// >>> 通过gap字符串分割字符串, 从前到后分析
  Pair<String?, String?> apartBy(String gap) {
    final int pos = this.indexOf(gap);
    if (pos == -1) {
      return Pair(null, this);
    }
    final String first = this.substring(0, pos);
    final String last = this.substring(pos + gap.length);
    return Pair(first, last);
  }

  /// >>> 通过gap字符串分割字符串, 从后到前分析
  Pair<String?, String?> apartReverseBy(String gap) {
    final int pos = this.lastIndexOf(gap);
    if (pos == -1) {
      return Pair(null, this);
    }
    final String first = this.substring(0, pos);
    final String last = this.substring(pos + gap.length);
    return Pair(first, last);
  }

  /// >>> 判断文件是否存在 >>>
  bool get fileExists {
    return File(this).existsSync();
  }
}

extension CStr on String {
  String operator -(String src) {
    return replaceAll(src, '');
  }

  bool isMatch(String regexp) {
    return RegExp(regexp).hasMatch(this);
  }

  Iterable<RegExpMatch> allMatchs(String regexp) {
    return RegExp(regexp).allMatches(this);
  }

  RegExpMatch? firstMatch(String regexp) {
    return RegExp(regexp).firstMatch(this);
  }

  Pair<String?, String?> splitLeft(String gap) {
    final int pos = indexOf(gap);
    if (pos == -1) {
      return Pair(null, this);
    }
    final String first = substring(0, pos);
    final String last = substring(pos + gap.length);
    return Pair(first, last);
  }

  Pair<String?, String?> splitRight(String gap) {
    final int pos = lastIndexOf(gap);
    if (pos == -1) {
      return Pair(null, this);
    }
    final String first = substring(0, pos);
    final String last = substring(pos + gap.length);
    return Pair(first, last);
  }

  String trimStringLeft(String trim) {
    if (startsWith(trim)) {
      return substring(0, length - trim.length);
    }
    return this;
  }

  String trimStringRight(String trim) {
    if (endsWith(trim)) {
      return substring(trim.length);
    }
    return this;
  }

  String combine(String gap, String tail) {
    return trimStringRight(gap) + gap + trimStringLeft(tail);
  }
}
