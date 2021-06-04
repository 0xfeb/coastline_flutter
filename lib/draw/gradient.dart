import 'package:flutter/material.dart';

/// >>> 方向指定, 一共8个方向 >>>
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

/// >>> 生成渐变 >>>
LinearGradient gradient(
    {required List<Color> colors,
    List<double>? stops,
    Direction direction = Direction.toRight}) {
  late AlignmentGeometry begin;
  late AlignmentGeometry end;
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

  return LinearGradient(colors: colors, stops: stops, begin: begin, end: end);
}
