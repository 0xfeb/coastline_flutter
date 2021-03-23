extension MapExtra on Map {
  /// >>> 通过数据寻找对象 >>>
  MapEntry<Key, Value> findByValue<Key, Value>(bool byValue(Value _)) {
    for (final key in this.keys) {
      final value = this[key];
      if (byValue(value)) {
        return MapEntry(key, value);
      }
    }
    return null;
  }
}
