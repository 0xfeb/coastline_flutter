import 'package:flutter/widgets.dart';

/// >>> 判断一个数值是否为空 >>>
bool isEmpty(dynamic l) {
  if (l == null || l == Null) {
    return true;
  }

  if (l is List || l is String || l is Map || l is Set) {
    return l.isEmpty;
  }

  if (l is TextEditingController) {
    return l.text.isEmpty;
  }

  return false;
}

/// >>> 判断一个数值是否非空 >>>
bool isNotEmpty(dynamic l) {
  return !isEmpty(l);
}

/// >>> 从组合数据中判断取得的数据 >>>
extension PairJudge<T> on List<T> {
  T? judge(List<bool> line) {
    for (int i = 0; i < line.length; ++i) {
      if (line[i]) {
        return this[i];
      }
    }
    if (length > line.length) {
      return this.last;
    }
    return null;
  }
}
