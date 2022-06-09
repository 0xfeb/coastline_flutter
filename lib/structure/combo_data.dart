abstract class CombineData {
  String toString();
}

/// >>> 组合两个数据 >>>
class Pair<A, B> extends CombineData {
  late A a;
  late B b;

  Pair(this.a, this.b);
  Pair.from(List<Object> source) {
    if (source.length < 2) {
      throw Exception('<Pair> too few values in list');
    }
    this.a = source[0] as A;
    this.b = source[1] as B;
  }

  @override
  String toString() {
    return '<Pair> $a $b';
  }
}

/// >>> 组合三个数据 >>>
class Triple<A, B, C> extends CombineData {
  late A a;
  late B b;
  late C c;

  Triple(this.a, this.b, this.c);
  Triple.from(List<Object> source) {
    if (source.length < 3) {
      throw Exception('<Triple> too few values in list');
    }
    a = source[0] as A;
    b = source[1] as B;
    c = source[2] as C;
  }

  @override
  String toString() {
    return '<Triple> $a $b $c';
  }
}

/// >>> 组合四个数据 >>>
class Quad<A, B, C, D> extends CombineData {
  late A a;
  late B b;
  late C c;
  late D d;

  @override
  Quad(this.a, this.b, this.c, this.d);
  Quad.from(List<Object> source) {
    if (source.length < 3) {
      throw Exception('<Quad> too few values in list');
    }
    a = source[0] as A;
    b = source[1] as B;
    c = source[2] as C;
    d = source[3] as D;
  }

  String toString() {
    return '<Quad> $a $b $c $d';
  }
}
