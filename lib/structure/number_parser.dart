import 'combo_data.dart';
import 'string_extra.dart';

extension NumberParser on String {
  int get _singleChineseNumber {
    if (this.length == 0) {
      return 0;
    }
    if (this == '两') {
      return 2;
    }
    final String c = this.substring(this.length - 1);
    final List<String> s = ['零', '一', '二', '三', '四', '五', '六', '七', '八', '九'];
    final int n = s.indexOf(c);
    if (n < 0) {
      return 0;
    }
    return n;
  }

  /// >>> 根据中文文本获得具体的数值 >>>
  int get chineseNumber {
    final Pair<String, String> wp = this.apartBy('万');
    print('wp -> $wp');
    final String w = wp.a ?? '零';
    final Pair<String, String> qp = wp.b.apartBy('千');
    print('qp -> $qp');
    final String q = qp.a ?? '零';
    final Pair<String, String> bp = qp.b.apartBy('百');
    print('bp -> $bp');
    final String b = bp.a ?? '零';
    final Pair<String, String> sp = bp.b.apartBy('十');
    print('sp -> $sp');
    final String s = sp.a ?? '零';
    final String g = sp.b ?? '零';
    return w._singleChineseNumber * 10000 +
        q._singleChineseNumber * 1000 +
        b._singleChineseNumber * 100 +
        s._singleChineseNumber * 10 +
        g._singleChineseNumber;
  }
}
