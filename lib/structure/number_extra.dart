extension NumberExtra on num {
  num between({num min, num max}) {
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
