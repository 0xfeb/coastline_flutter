//import 'package:flutter/material.dart';

import 'dart:io';

import 'combo_data.dart';

extension StringExtra on String {
  /// >>> 通过gap字符串分割字符串, 从前到后分析
  Pair<String?, String> apartBy(String gap) {
    final int pos = this.indexOf(gap);
    if (pos == -1) {
      return Pair(null, this);
    }
    final String first = this.substring(0, pos);
    final String last = this.substring(pos + gap.length);
    return Pair(first, last);
  }

  /// >>> 通过gap字符串分割字符串, 从后到前分析
  Pair<String?, String> apartReverseBy(String gap) {
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
