import 'package:flutter/material.dart';

enum Direction {
  toDown,
  toUp,
  toRight,
  toLeft,
  toTopLeft,
  toTopRight,
  toBottomLeft,
  toBottomRight,
}

extension GradientExtra on LinearGradient {
  /// >>> 生成渐变图形 >>>
  static LinearGradient fromList(
      {List<Color> colors,
      List<double> stops,
      Direction direction = Direction.toRight,
      TileMode tileMode = TileMode.clamp,
      double rotate = 0}) {
    GradientRotation gr = GradientRotation(rotate);
    AlignmentGeometry begin;
    AlignmentGeometry end;
    switch (direction) {
      case Direction.toDown:
        begin = Alignment.topLeft;
        end = Alignment.bottomLeft;
        break;
      case Direction.toUp:
        begin = Alignment.bottomLeft;
        end = Alignment.topLeft;
        break;
      case Direction.toRight:
        begin = Alignment.topLeft;
        end = Alignment.topRight;
        break;
      case Direction.toLeft:
        begin = Alignment.topRight;
        end = Alignment.topLeft;
        break;
      case Direction.toTopLeft:
        begin = Alignment.bottomRight;
        end = Alignment.topLeft;
        break;
      case Direction.toTopRight:
        begin = Alignment.bottomLeft;
        end = Alignment.topRight;
        break;
      case Direction.toBottomLeft:
        begin = Alignment.topRight;
        end = Alignment.bottomLeft;
        break;
      case Direction.toBottomRight:
        begin = Alignment.topLeft;
        end = Alignment.bottomRight;
        break;
    }

    return LinearGradient(
        colors: colors, stops: stops, transform: gr, begin: begin, end: end);
  }
}
