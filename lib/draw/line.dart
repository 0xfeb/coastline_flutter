import 'dart:ui';

// > 线
/// 多段线路径定义
///
/// 用于描述由多个点连接而成的折线或曲线路径
///
/// {@template line}
/// [points] 点集合 - 构成多段线的坐标点列表（必须）
/// [smoothLevel] 平滑等级 - 控制路径的平滑程度（1.0为基准值，暂未实现具体算法）
/// {@endtemplate}
class Line {
  final List<Offset> points;
  final double smoothLevel;

  Line({required this.points, this.smoothLevel = 1});
}

/// >>> 线中取一个偏移点(从0.0到1.0) >>>
/// 计算线段上的相对位置点
///
/// @param point1 起始点坐标
/// @param point2 结束点坐标
/// @param offset 偏移比例（0.0-1.0对应起点到终点）
/// @return 返回线段上对应比例位置的坐标点
Offset _offsetOfLine(Offset point1, Offset point2, double offset) {
  final x = (point2.dx - point1.dx) * offset + point1.dx;
  final y = (point2.dy - point1.dy) * offset + point1.dy;
  return Offset(x, y);
}

/// >>> 线中取一个偏移点(大于0, 是point1这边偏移, 小于0, 是point2这边偏移) >>>
/// 计算线段上的绝对位置点
///
/// @param point1 起始点坐标
/// @param point2 结束点坐标
/// @param position 偏移距离（正值从起点方向偏移，负值从终点方向偏移）
/// @return 返回线段上对应绝对位置的坐标点
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

/// 直线路径定义
///
/// 适用于需要精确计算直线轨迹的场景，如：
/// - 直线运动轨迹计算
/// - 几何图形边线定义
/// - 坐标点线性插值计算
class StraightLine {
  /// 直线起点坐标
  final Offset point1;

  /// 直线终点坐标
  final Offset point2;

  /// 创建直线路径
  StraightLine(this.point1, this.point2);

  /// 获取比例位置点
  ///
  /// @param rate 比例值（0.0对应起点，1.0对应终点）
  /// @return 返回直线上的对应比例位置坐标
  Offset positionInRate(double rate) {
    return _offsetOfLine(point1, point2, rate);
  }

  /// >>> 线中取一个偏移点(大于0, 是point1这边偏移, 小于0, 是point2这边偏移) >>>
  /// 获取绝对偏移位置点
  ///
  /// @param offset 偏移量（正值向终点方向，负值向起点方向）
  /// @return 返回直线上的对应绝对偏移坐标
  Offset positionOfOffset(double offset) {
    return _positionOfLine(point1, point2, offset);
  }
}
