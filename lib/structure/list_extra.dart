import 'dart:math';

import 'value.dart';

/// 扩展MapEntry类，提供额外的功能。
extension MapEntryExtra<K, V> on MapEntry<K, V> {
  /// 比较两个MapEntry是否相等。
  ///
  /// 参数:
  /// - [other]: 要比较的另一个MapEntry。
  ///
  /// 返回值:
  /// - 如果两个MapEntry的键和值都相等，则返回`true`，否则返回`false`。
  bool equalTo(MapEntry<K, V> other) {
    return this.key == other.key && this.value == other.value;
  }
}

/// 扩展List<MapEntry>类，提供额外的功能。
extension MapEntryListExtra<K, V> on List<MapEntry<K, V>> {
  /// 比较两个MapEntry列表是否相等。
  ///
  /// 参数:
  /// - [other]: 要比较的另一个MapEntry列表。
  ///
  /// 返回值:
  /// - 如果两个列表的长度相同且每个对应位置的MapEntry都相等，则返回`true`，否则返回`false`。
  bool equalTo(List<MapEntry<K, V>> other) {
    if (this.length != other.length) {
      return false;
    }

    for (int i = 0; i < this.length; ++i) {
      if (!this[i].equalTo(other[i])) {
        return false;
      }
    }

    return true;
  }
}

/// 扩展List类，提供额外的功能。
extension ListExtra<T> on List<T> {
  /// 混合插入两个列表。
  ///
  /// 参数:
  /// - [next]: 要插入的另一个列表。
  ///
  /// 返回值:
  /// - 返回一个包含两个列表元素的混合列表。
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

  /// 混合插入元素。
  ///
  /// 参数:
  /// - [item]: 要插入的元素。
  /// - [around]: 是否在列表的开头和结尾也插入元素，默认为`false`。
  ///
  /// 返回值:
  /// - 返回一个包含插入元素的列表。
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

  /// 获取随机元素。
  ///
  /// 返回值:
  /// - 返回列表中的一个随机元素，如果列表为空则返回`null`。
  T? get randomItem {
    if (this.isEmpty) {
      return null;
    }
    int n = Random().nextInt(this.length);
    return this[n];
  }

  /// 检查两个列表是否相同。
  ///
  /// 参数:
  /// - [other]: 要比较的另一个列表。
  /// - [compare]: 自定义的比较函数，可选。
  ///
  /// 返回值:
  /// - 如果两个列表的长度相同且每个对应位置的元素都相等，则返回`true`，否则返回`false`。
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

  /// 检查列表是否以另一个列表开头。
  ///
  /// 参数:
  /// - [other]: 要检查的另一个列表。
  /// - [compare]: 自定义的比较函数，可选。
  ///
  /// 返回值:
  /// - 如果列表以另一个列表开头，则返回`true`，否则返回`false`。
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

  /// 检查列表是否以另一个列表结尾。
  ///
  /// 参数:
  /// - [other]: 要检查的另一个列表。
  /// - [compare]: 自定义的比较函数，可选。
  ///
  /// 返回值:
  /// - 如果列表以另一个列表结尾，则返回`true`，否则返回`false`。
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

  /// 获取带序列的数据列表。
  ///
  /// 返回值:
  /// - 返回一个包含索引和元素的MapEntry列表。
  Iterable<MapEntry<int, T>> get indicate {
    return this.asMap().entries;
  }

  /// 查找子列表在当前列表中的起始索引。
  ///
  /// 参数:
  /// - [a]: 要查找的子列表。
  ///
  /// 返回值:
  /// - 返回子列表在当前列表中的起始索引，如果没有找到则返回`null`。
  int? find(List<T> a) {
    if (a.length > length) {
      return null;
    }

    int? result;
    int nLength = length - a.length;
    print("find -> nlength $nLength");
    for (int i = 0; i < nLength; ++i) {
      result = i;
      for (int j = 0; j < a.length; ++j) {
        if (this[i + j] != a[j]) {
          result = null;
          break;
        }
      }
    }
    return result;
  }

  /// 查找子列表在当前列表中的最后一个起始索引。
  ///
  /// 参数:
  /// - [a]: 要查找的子列表。
  ///
  /// 返回值:
  /// - 返回子列表在当前列表中的最后一个起始索引，如果没有找到则返回`null`。
  int? findLast(List<T> a) {
    if (a.length > length) {
      return null;
    }

    int? result;
    int nLength = length - a.length;

    for (int i = nLength; i >= 0; --i) {
      result = i;
      for (int j = 0; j < a.length; ++j) {
        if (this[j + i] != a[j]) {
          result = null;
          break;
        }
        if (j == a.length - 1) {
          return result;
        }
      }
    }
    return result;
  }

  // 两个数组比较
  /// 比较两个列表是否相等。
  ///
  /// 参数:
  /// - [list]: 要比较的另一个列表。
  /// - [c]: 自定义的比较函数，可选。
  ///
  /// 返回值:
  /// - 如果两个列表的长度相同且每个对应位置的元素都相等，则返回`true`，否则返回`false`。
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

/// 产生一个序列列表。
///
/// 参数:
/// - [start]: 序列的起始值，默认为0。
/// - [length]: 序列的长度。
///
/// 返回值:
/// - 返回一个包含指定长度的序列列表。
List<int> inc({int start = 0, required int length}) {
  return List<int>.generate(length, (index) => start + index);
}