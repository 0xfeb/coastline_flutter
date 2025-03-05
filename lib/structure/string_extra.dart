import 'dart:io';

import 'package:flutter/widgets.dart';

extension StringExtra on String {
  /// 通过gap字符串分割字符串, 从前到后分析
  /// 
  /// [gap]: 用于分割的字符串
  /// 
  /// 返回一个元组，包含分割后的第一个部分和剩余部分。
  /// 如果gap不存在，则返回(null, 原字符串)
  (String?, String?) apartBy(String gap) {
    final int pos = this.indexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    final String first = this.substring(0, pos);
    final String last = this.substring(pos + gap.length);
    return (first, last);
  }

  /// 通过gap字符串分割字符串, 从后到前分析
  /// 
  /// [gap]: 用于分割的字符串
  /// 
  /// 返回一个元组，包含分割后的第一个部分和剩余部分。
  /// 如果gap不存在，则返回(null, 原字符串)
  (String?, String?) apartReverseBy(String gap) {
    final int pos = this.lastIndexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    final String first = this.substring(0, pos);
    final String last = this.substring(pos + gap.length);
    return (first, last);
  }

  /// 判断文件是否存在
  /// 
  /// 返回一个布尔值，表示文件是否存在
  bool get fileExists {
    return File(this).existsSync();
  }
}

extension CStr on String {
  /// 移除字符串中的指定子字符串
  /// 
  /// [src]: 要移除的子字符串
  /// 
  /// 返回移除指定子字符串后的字符串
  String operator -(String src) {
    return replaceAll(src, '');
  }

  /// 判断字符串是否匹配正则表达式
  /// 
  /// [regexp]: 正则表达式字符串
  /// 
  /// 返回一个布尔值，表示字符串是否匹配正则表达式
  bool isMatch(String regexp) {
    return RegExp(regexp).hasMatch(this);
  }

  /// 查找字符串中所有匹配正则表达式的子字符串
  /// 
  /// [regexp]: 正则表达式字符串
  /// 
  /// 返回一个可迭代的RegExpMatch对象集合
  Iterable<RegExpMatch> allMatchs(String regexp) {
    return RegExp(regexp).allMatches(this);
  }

  /// 查找字符串中第一个匹配正则表达式的子字符串
  /// 
  /// [regexp]: 正则表达式字符串
  /// 
  /// 返回一个RegExpMatch对象，如果没有匹配则返回null
  RegExpMatch? firstMatch(String regexp) {
    return RegExp(regexp).firstMatch(this);
  }

  /// 通过gap字符串分割字符串, 从前到后分析
  /// 
  /// [gap]: 用于分割的字符串
  /// 
  /// 返回一个元组，包含分割后的第一个部分和剩余部分。
  /// 如果gap不存在，则返回(null, 原字符串)
  (String?, String?) splitLeft(String gap) {
    final int pos = indexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    final String first = substring(0, pos);
    final String last = substring(pos + gap.length);
    return (first, last);
  }

  /// 通过gap字符串分割字符串, 从后到前分析
  /// 
  /// [gap]: 用于分割的字符串
  /// 
  /// 返回一个元组，包含分割后的第一个部分和剩余部分。
  /// 如果gap不存在，则返回(null, 原字符串)
  (String?, String?) splitRight(String gap) {
    final int pos = lastIndexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    final String first = substring(0, pos);
    final String last = substring(pos + gap.length);
    return (first, last);
  }

  /// 移除字符串左侧的指定子字符串
  /// 
  /// [trim]: 要移除的子字符串
  /// 
  /// 返回移除左侧指定子字符串后的字符串
  String trimStringLeft(String trim) {
    if (startsWith(trim)) {
      return substring(trim.length);
    }
    return this;
  }

  /// 移除字符串右侧的指定子字符串
  /// 
  /// [trim]: 要移除的子字符串
  /// 
  /// 返回移除右侧指定子字符串后的字符串
  String trimStringRight(String trim) {
    if (endsWith(trim)) {
      return substring(0, length - trim.length);
    }
    return this;
  }

  /// 将两个字符串通过gap连接起来，并去除gap在连接处的重复部分
  /// 
  /// [gap]: 用于连接的字符串
  /// [tail]: 要连接的字符串
  /// 
  /// 返回连接后的字符串
  String combine(String gap, String tail) {
    return trimStringRight(gap) + gap + tail.trimStringLeft(gap);
  }

  /// 打印字符串到控制台
  /// 
  /// 返回原字符串
  String print() {
    debugPrint(this);
    return this;
  }
}