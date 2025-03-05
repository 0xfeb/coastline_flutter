extension NumberExtra on num {
  /// 限制数值在一个范围内。
  ///
  /// 参数:
  /// - [min]: 数值的最小值，可选。
  /// - [max]: 数值的最大值，可选。
  ///
  /// 返回值:
  /// - 返回限制在 [min] 和 [max] 范围内的数值。
  num limitBetween(num? min, num? max) {
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

extension IntExtra on int {
  /// 获取基于数字的文本，限定位数，位数不够时自动补0。
  ///
  /// 参数:
  /// - [digitNumber]: 期望的数字位数，默认为2。
  ///
  /// 返回值:
  /// - 返回一个字符串，表示数字，位数不够时前面补0。
  String digitsString({int digitNumber = 2}) {
    String n = this < 0 ? '-' : '';
    String p = this.abs().toString();
    for (int i = 0; i < digitNumber - p.length; ++i) {
      n += '0';
    }
    n += p;
    return n;
  }
}