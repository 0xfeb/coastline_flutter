/// >>> 组合两个数据 >>>
class Pair<A, B> {
  final A a;
  final B b;

  Pair(this.a, this.b);

  String toString() {
    return '<Pair> $a $b';
  }
}

/// >>> 组合三个数据 >>>
class Triple<A, B, C> {
  final A a;
  final B b;
  final C c;

  Triple(this.a, this.b, this.c);

  String toString() {
    return '<Triple> $a $b $c';
  }
}

/// >>> 组合四个数据 >>>
class Quad<A, B, C, D> {
  final A a;
  final B b;
  final C c;
  final D d;

  Quad(this.a, this.b, this.c, this.d);

  String toString() {
    return '<Quad> $a $b $c $d';
  }
}
