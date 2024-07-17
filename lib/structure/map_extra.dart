import "value.dart";

extension MapExtra on Map {
  /// >>> 通过数据寻找对象 >>>
  MapEntry<Key, Value?>? findByValue<Key, Value>(bool byValue(Value? _)) {
    for (final key in this.keys) {
      final value = this[key];
      if (byValue(value)) {
        return MapEntry(key, value);
      }
    }
    return null;
  }

  MapEntry<K, V>? find<K, V>({Check<K>? key, Check<V>? value}) {
    if (isNotEmpty(key) && isNotEmpty(value)) {
      for (final entry in entries) {
        if (key!(entry.key) && value!(entry.value)) {
          return MapEntry(entry.key, entry.value);
        }
      }
    }

    if (isNotEmpty(key)) {
      for (final key in keys) {
        if (key!(key)) {
          return MapEntry(key, this[key]);
        }
      }
    }

    if (isNotEmpty(value)) {
      for (final value in values) {
        if (value!(value)) {
          return MapEntry(keys.first, value);
        }
      }
    }
    return null;
  }
}
