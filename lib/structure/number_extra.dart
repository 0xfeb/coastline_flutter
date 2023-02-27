extension NumberExtra on num {
  /// >>> 限制数值在一个范围内 >>>
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
  // >>> 获取基于数字的文本, 限定位数, 位数不够的时候, 自动凑0
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

// String fourDigits(int n) {
//   int absN = n.abs();
//   String sign = n < 0 ? "-" : "";
//   if (absN >= 1000) return "$n";
//   if (absN >= 100) return "${sign}0$absN";
//   if (absN >= 10) return "${sign}00$absN";
//   return "${sign}000$absN";
// }

// String sixDigits(int n) {
//   assert(n < -9999 || n > 9999);
//   int absN = n.abs();
//   String sign = n < 0 ? "-" : "+";
//   if (absN >= 100000) return "$sign$absN";
//   return "${sign}0$absN";
// }

// String threeDigits(int n) {
//   if (n >= 100) return "$n";
//   if (n >= 10) return "0$n";
//   return "00$n";
// }

// String twoDigits(int n) {
//   if (n >= 10) return "$n";
//   return "0$n";
// }
