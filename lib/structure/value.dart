/// >>> 数据判断类 >>>
class Value {
  /// >>> 判断一个数值是否为空 >>>
  static bool isEmpty(dynamic l) {
    if (l == null || l == Null) {
      return true;
    }

    if (l is List || l is String || l is Map || l is Set) {
      return l.isEmpty;
    }

    return false;
  }
}
