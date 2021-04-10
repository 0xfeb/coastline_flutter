import 'dart:ui';

class Line {
  final List<Offset> points;
  final double smoothLevel;

  Line({this.points, this.smoothLevel = 10});
}
