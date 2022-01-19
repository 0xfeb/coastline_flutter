import 'dart:ui';

// > 线
class Line {
  final List<Offset> points;
  final double smoothLevel;

  Line({required this.points, this.smoothLevel = 1});
}

/// >>> 线中取一个偏移点(从0.0到1.0) >>>
Offset _offsetOfLine(Offset point1, Offset point2, double offset) {
  final x = (point2.dx - point1.dx) * offset + point1.dx;
  final y = (point2.dy - point1.dy) * offset + point1.dy;
  return Offset(x, y);
}

/// >>> 线中取一个偏移点(大于0, 是point1这边偏移, 小于0, 是point2这边偏移) >>>
Offset _positionOfLine(Offset point1, Offset point2, double position) {
  final distance = (point2 - point1).distance;
  double offset = 0;
  if (position >= 0) {
    offset = position / distance;
  } else {
    offset = (distance + position) / distance;
  }
  return _offsetOfLine(point1, point2, offset);
}

class StraightLine {
  final Offset point1;
  final Offset point2;

  StraightLine(this.point1, this.point2);

  // from 0 -> 1
  Offset positionInRate(double rate) {
    return _offsetOfLine(point1, point2, rate);
  }

  /// >>> 线中取一个偏移点(大于0, 是point1这边偏移, 小于0, 是point2这边偏移) >>>
  Offset positionOfOffset(double offset) {
    return _positionOfLine(point1, point2, offset);
  }
}
