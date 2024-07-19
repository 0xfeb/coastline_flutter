import 'package:flutter/material.dart';

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

// 判断v变量的长度, 如果是空, 返回0, 如果是组合变量, 返回组合数量, 如果是其它类型(如int), 返回1
int len(dynamic v) {
  if (isEmpty(v)) {
    return 0;
  }

  if (v is Iterable || v is Map || v is Set || v is String) {
    return v.length;
  }

  if (v is TextEditingController) {
    return v.text.length;
  }

  return 1;
}

// 检查工具函数
typedef Check<KV> = bool Function(KV);

// 比较工具函数
typedef Compare<V> = bool Function(V, V);
