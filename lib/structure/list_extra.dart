import 'dart:math';

import 'value.dart';

extension ListExtra<T> on List<T> {
  /// >>> 混合插入两个list >>>
  List<T> mixList(List<T> next) {
    List<T> result = [];
    final int maxCount = max(next.length, this.length);

    for (int i = 0; i < maxCount; ++i) {
      if (i < this.length) {
        result.add(this[i]);
      }

      if (i < next.length) {
        result.add(next[i]);
      }
    }

    return result;
  }

  /// >>>  混合插入元素 >>>
  List<T> mixItem(T item, {bool around = false}) {
    List<T> result = [];

    for (int i = 0; i < this.length; ++i) {
      if (i == 0) {
        if (around) {
          result.add(item);
        }
      } else {
        result.add(item);
      }
      result.add(this[i]);
    }

    if (around == true) {
      result.add(item);
    }

    return result;
  }

  T? get randomItem {
    if (this.isEmpty) {
      return null;
    }
    int n = Random().nextInt(this.length);
    return this[n];
  }

  /// >>> 检查两个列表是否相同 >>>
  bool isEqualTo(List<T> other, {bool Function(T, T)? compare}) {
    if (this.length != other.length) {
      return false;
    }

    for (int i = 0; i < this.length; ++i) {
      if (compare == null) {
        if (this[i] != other[i]) {
          return false;
        }
      } else {
        if (!compare(this[i], other[i])) {
          return false;
        }
      }
    }

    return true;
  }

  /// >>> 由另外一个List开头 >>>
  bool startWith(List<T> other, {bool Function(T, T)? compare}) {
    if (other.length > this.length) {
      return false;
    }

    for (int i = 0; i < other.length; ++i) {
      var n = other[i];
      var m = this[i];
      if (!compare!(n, m)) {
        return false;
      }
    }

    return true;
  }

  /// >>> 由另外一个List结束 >>>
  bool endWith(List<T> other, {bool Function(T, T)? compare}) {
    if (other.length > this.length) {
      return false;
    }

    for (int i = 0; i < other.length; ++i) {
      var n = other[other.length - i - 1];
      var m = this[length - i - 1];
      if (!compare!(n, m)) {
        return false;
      }
    }

    return true;
  }

  /// >>> 获得带序列的数据列表 >>>
  Iterable<MapEntry<int, T>> get indicate {
    return this.asMap().entries;
  }

  int? find(List<T> a) {
    if (a.length > length) {
      return null;
    }

    int? result;
    int nLength = length - a.length;
    for (int i = 0; i < nLength; ++i) {
      result = i;
      for (int j = 0; j < a.length; ++j) {
        if (this[i] != a[j]) {
          result = null;
          break;
        }
      }
    }
    return result;
  }

  int? findLast(List<T> a) {
    if (a.length > length) {
      return null;
    }

    int? result;
    int nLength = length - a.length;
    for (int i = nLength - 1; i >= 0; ++i) {
      result = i;
      for (int j = a.length - 1; j >= 0; ++j) {
        if (this[i] != a[j]) {
          result = null;
          break;
        }
      }
    }
    return result;
  }

  // 两个数组比较
  bool compare<V>(Iterable<V> list, {Compare? c}) {
    if (list.length != this.length) {
      return false;
    }
    for (int i = 0; i < list.length; i++) {
      if (c == null) {
        if (elementAt(i) != list.elementAt(i)) {
          return false;
        }
      } else {
        if (!c(elementAt(i), list.elementAt(i))) {
          return false;
        }
      }
    }
    return true;
  }
}

/// >>> 产生一个序列列表 >>>
List<int> inc({int start = 0, required int length}) {
  return List<int>.generate(length, (index) => start + index);
}
