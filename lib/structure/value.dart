/// >>> 判断一个数值是否为空 >>>
bool isEmpty(dynamic l) {
  if (l == null || l == Null) {
    return true;
  }

  if (l is List || l is String || l is Map || l is Set) {
    return l.isEmpty;
  }

  return false;
}

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

  return 1;
}

// 检查工具函数
typedef Check<KV> = bool Function(KV);

// 比较工具函数
typedef Compare<V> = bool Function(V, V);

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
