import 'package:flutter/material.dart';

/// >>> 方向指定, 一共8个方向 >>>
/// 方向指定
enum Direction {
  /// 朝向下方
  toDown,
  /// 朝向上方
  toUp,
  /// 朝向右方
  toRight,
  /// 朝向左方
  toLeft,
  /// 朝向左上
  toTopLeft,
  /// 朝向右上
  toTopRight,
  /// 朝向左下
  toBottomLeft,
  /// 朝向右下
  toBottomRight,
}

/// 生成线性渐变色
///
/// {@template gradient}
/// 创建一个可配置方向的线性渐变对象
/// {@endtemplate}
///
/// @param colors 颜色数组 - 渐变色使用的颜色列表（必须）
/// @param stops 渐变位置 - 颜色对应的位置数组（0.0-1.0），可选
/// @param direction 渐变方向 - 使用[Direction]枚举指定渐变方向，默认为向右
/// @return 返回配置好的[LinearGradient]渐变对象
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
