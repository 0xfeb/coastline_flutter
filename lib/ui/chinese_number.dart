import 'package:coastline/coastline.dart';

extension ChineseNumber on String {
  (String?, String) apart(String gap) {
    int pos = this.indexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    String first = this.substring(0, pos);
    String last = this.substring(pos + gap.length);
    return (first, last);
  }

  (String?, String) apartLast(String gap) {
    int pos = this.lastIndexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    String first = this.substring(0, pos);
    String last = this.substring(pos + gap.length);
    return (first, last);
  }

  int get _singleNumber {
    if (this.length == 0) {
      return 0;
    }
    if (this == '两') {
      return 2;
    }
    String c = this.substring(this.length - 1);
    List<String> s = ['零', '一', '二', '三', '四', '五', '六', '七', '八', '九'];
    int n = s.indexOf(c);
    if (n < 0) {
      return 0;
    }
    return n;
  }

  int get chineseNumber {
    (String?, String) wp = this.apart('万');
    print('wp -> $wp');
    String w = wp.$1 ?? '零';
    (String?, String) qp = wp.$2.apart('千');
    print('qp -> $qp');
    String q = qp.$1 ?? '零';
    (String?, String) bp = qp.$2.apart('百');
    print('bp -> $bp');
    String b = bp.$1 ?? '零';
    (String?, String) sp = bp.$2.apart('十');
    print('sp -> $sp');
    String s = sp.$1 ?? '零';
    String g = sp.$2;
    return w._singleNumber * 10000 +
        q._singleNumber * 1000 +
        b._singleNumber * 100 +
        s._singleNumber * 10 +
        g._singleNumber;
  }
}
