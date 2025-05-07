import "value.dart";

/// 扩展Map类，提供额外的功能。
extension MapExtra on Map {
  /// 通过数据寻找对象。
  ///
  /// 参数:
  /// - [byValue]: 一个函数，用于判断值是否匹配。
  ///
  /// 返回值:
  /// - 如果找到匹配的键值对，则返回该键值对，否则返回`null`。
  MapEntry<Key, Value?>? findByValue<Key, Value>(bool byValue(Value? _)) {
    for (final key in this.keys) {
      final value = this[key];
      if (byValue(value)) {
        return MapEntry(key, value);
      }
    }
    return null;
  }

  /// 查找满足条件的键值对。
  ///
  /// 参数:
  /// - [key]: 一个函数，用于判断键是否匹配，可选。
  /// - [value]: 一个函数，用于判断值是否匹配，可选。
  ///
  /// 返回值:
  /// - 如果找到匹配的键值对，则返回该键值对，否则返回`null`。
  MapEntry<K, V>? find<K, V>({Check<K>? key, Check<V>? value}) {
    if (isNotEmpty(key) && isNotEmpty(value)) {
      for (final entry in entries) {
        if (key!(entry.key) && value!(entry.value)) {
          return MapEntry(entry.key, entry.value);
        }
      }
    }

    if (isNotEmpty(key)) {
      for (final entry in entries) {
        if (key!(entry.key)) {
          return MapEntry(entry.key, entry.value);
        }
      }
    }

    if (isNotEmpty(value)) {
      for (final entry in entries) {
        if (value!(entry.value)) {
          return MapEntry(entry.key, entry.value);
        }
      }
    }
    return null;
  }
}
