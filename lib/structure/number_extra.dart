extension NumberExtra on num {
  /// >>> 限制数值在一个范围内 >>>
  num between(num min, num max) {
    if (min != null) {
      if (this < min) {
        return min;
      }
    }

    if (max != null) {
      if (this > max) {
        return max;
      }
    }

    return this;
  }
}
