import 'package:flutter/material.dart';

import 'line.dart';

/// 路径联合操作
///
/// 将两个Path对象进行并集运算
///
/// @param path1 第一个路径对象
/// @param path2 第二个路径对象
/// @return 返回合并后的新Path对象
Path _pathUnion(Path path1, Path path2) {
  return Path.combine(PathOperation.union, path1, path2);
}

/// 路径挖洞操作
///
/// 从基础路径中减去另一个路径区域
///
/// @param path1 基础路径对象
/// @param path2 要减去的路径区域
/// @return 返回挖洞后的新Path对象
Path _pathHole(Path path1, Path path2) {
  return Path.combine(PathOperation.difference, path1, path2);
}

/// 创建矩形路径
///
/// @param rect 矩形区域
/// @return 返回矩形路径对象
Path _rectPath(Rect rect) {
  return Path()..addRect(rect);
}

/// 创建圆角矩形路径
///
/// @param rect 矩形区域
/// @param topLeftCorner 左上角圆角半径
/// @param topRightCorner 右上角圆角半径
/// @param bottomLeftCorner 左下角圆角半径
/// @param bottomRightCorner 右下角圆角半径
/// @param allCorners 统一设置所有圆角半径
/// @param leftCorners 同时设置左右两侧圆角半径
/// @param rightCorners 同时设置左右两侧圆角半径
/// @param topCorners 同时设置上下两侧圆角半径
/// @param bottomCorners 同时设置上下两侧圆角半径
/// @return 返回圆角矩形路径对象
Path _rrectPath(Rect rect,
    {double? topLeftCorner,
    double? topRightCorner,
    double? bottomLeftCorner,
    double? bottomRightCorner,
    double? allCorners,
    double? leftCorners,
    double? rightCorners,
    double? topCorners,
    double? bottomCorners}) {
  Radius tl = Radius.zero;
  Radius tr = Radius.zero;
  Radius bl = Radius.zero;
  Radius br = Radius.zero;
  if (allCorners != null) {
    tl = Radius.circular(allCorners);
    tr = tl;
    bl = tl;
    br = tl;
  }

  if (leftCorners != null) {
    tl = Radius.circular(leftCorners);
    bl = tl;
  }

  if (rightCorners != null) {
    tr = Radius.circular(rightCorners);
    br = tr;
  }

  if (topCorners != null) {
    tl = Radius.circular(topCorners);
    tr = tl;
  }

  if (bottomCorners != null) {
    bl = Radius.circular(bottomCorners);
    br = bl;
  }

  if (topLeftCorner != null) {
    tl = Radius.circular(topLeftCorner);
  }

  if (topRightCorner != null) {
    tr = Radius.circular(topRightCorner);
  }

  if (bottomLeftCorner != null) {
    bl = Radius.circular(bottomLeftCorner);
  }

  if (bottomRightCorner != null) {
    br = Radius.circular(bottomRightCorner);
  }

  return Path()
    ..addRRect(RRect.fromLTRBAndCorners(
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      topLeft: tl,
      topRight: tr,
      bottomLeft: bl,
      bottomRight: br,
    ));
}

/// >>> 圆形Path >>>
Path _cyclePath(Offset center, double radius) {
  Rect rect = Rect.fromCenter(center: center, width: radius, height: radius);
  return Path()..addOval(rect);
}

/// >>> 三角形Path >>>
Path _triplePath(Offset a, Offset b, Offset c) {
  return Path()
    ..moveTo(a.dx, a.dy)
    ..lineTo(b.dx, b.dy)
    ..lineTo(c.dx, c.dy)
    ..close();
}

/// >>> 直角三角形Path >>>
/// anglePoint -- 直角所在点的位置
/// x -- 基于直角点的横轴偏移
/// y -- 基于直角点的竖轴偏移
Path _angleTriplePath(Offset anglePoint, double x, double y) {
  return _triplePath(
    anglePoint,
    Offset(anglePoint.dx + x, anglePoint.dy),
    Offset(anglePoint.dx, anglePoint.dy + y),
  );
}

// /// >>> 等腰三角形Path >>>
// /// point1 -- 顺时针的第一个角
// /// point2 -- 顺时针的第二个角
// /// height -- 通过height计算得到第三个角
// Path isoTriplePath(Offset point1, Offset point2, double height) {
//   print('point1 -> $point1 point2 -> $point2');
//   final l = (point1 - point2).distance;
//   print('distance -> $l');
//   final y = (point2.dy + point1.dy) / 2 + (point2.dx - point1.dx) * height / l;
//   final x = (point2.dx + point1.dx) / 2 + (point2.dy - point1.dy) * height / l;
//   print('x - $x y - $y');
//   return triplePath(point1, point2, Offset(x, y));
// }

// /// >>> 等边三角形Path >>>
// /// point1 -- 顺时针的第一个角
// /// point2 -- 顺时针的第二个角, 第三个角通过计算得到
// Path equalTriplePath(Offset point1, Offset point2) {
//   final l = (point1 - point2).distance;
//   final h = sqrt(3) * l / 2;
//   return isoTriplePath(point1, point2, h);
// }

/// >>> 多个点形成一个封闭的形状, 并且支持圆角功能 >>>
Path _closedPath(List<Offset> points, {double cornerRadius = 4.0}) {
  Path path = Path();
  Offset? a;
  Offset b;
  Offset ap;
  Offset bp;
  Offset? first;
  late Offset firstP;
  for (int i = 0; i < points.length; ++i) {
    a = points[i];
    b = (i == points.length - 1) ? points[0] : points[i + 1];
    bp = StraightLine(a, b).positionOfOffset(-cornerRadius);
    ap = StraightLine(a, b).positionOfOffset(cornerRadius);

    if (i == 0) {
      path.moveTo(ap.dx, ap.dy);
      first = a;
      firstP = ap;
    } else {
      path.quadraticBezierTo(a.dx, a.dy, ap.dx, ap.dy);
    }

    path.lineTo(bp.dx, bp.dy);
  }

  Offset lastP = StraightLine(a!, first!).positionOfOffset(-cornerRadius);
  path.lineTo(lastP.dx, lastP.dy);
  path.quadraticBezierTo(first.dx, first.dy, firstP.dx, firstP.dy);

  return path;
}

/// >>> 多个点形成一个封闭的形状, 不支持圆角功能 >>>
Path _closedSharpPath(List<Offset> points) {
  Path path = Path();
  path.moveTo(points.first.dx, points.first.dy);
  for (Offset point in points) {
    path.lineTo(point.dx, point.dy);
  }
  path.close();
  return path;
}

Path _openSharpPath(List<Offset> points) {
  Path path = Path();
  path.moveTo(points.first.dx, points.first.dy);
  for (Offset point in points) {
    path.lineTo(point.dx, point.dy);
  }
  return path;
}

/// >>> 多个点形成一个线条, 并且支持圆角功能 >>>
Path _linePath(Line line) {
  Path path = Path();
  Offset start = line.points.first;
  Offset startP;
  Offset nextP;
  Offset? next;

  path.moveTo(start.dx, start.dy);

  for (int i = 1; i < line.points.length; ++i) {
    next = line.points[i];
    startP = StraightLine(start, next).positionOfOffset(line.smoothLevel);
    nextP = StraightLine(start, next).positionOfOffset(-line.smoothLevel);

    path.quadraticBezierTo(start.dx, start.dy, startP.dx, startP.dy);

    if (i == line.points.length - 1) {
      path.lineTo(next.dx, next.dy);
    } else {
      path.lineTo(nextP.dx, nextP.dy);
    }

    start = next;
  }

  return path;
}

extension PathExtra on Path {
  Path union(Path other) {
    return _pathUnion(this, other);
  }

  Path hole(Path dig) {
    return _pathHole(this, dig);
  }

  static Path rect(Rect rect) {
    return _rectPath(rect);
  }

  static Path rrect(Rect rect,
      {double? topLeftCorner,
      double? topRightCorner,
      double? bottomLeftCorner,
      double? bottomRightCorner,
      double? allCorners,
      double? leftCorners,
      double? rightCorners,
      double? topCorners,
      double? bottomCorners}) {
    return _rrectPath(
      rect,
      topLeftCorner: topLeftCorner,
      topRightCorner: topRightCorner,
      bottomLeftCorner: bottomLeftCorner,
      bottomRightCorner: bottomRightCorner,
      allCorners: allCorners,
      leftCorners: leftCorners,
      rightCorners: rightCorners,
      topCorners: topCorners,
      bottomCorners: bottomCorners,
    );
  }

  static Path cycle({required Offset center, required double radius}) {
    return _cyclePath(center, radius);
  }

  static Path triple(
      {required Offset point1,
      required Offset point2,
      required Offset point3}) {
    return _triplePath(point1, point2, point3);
  }

  static Path angleTriple(
      {required Offset anglePoint,
      required double length1,
      required double length2}) {
    return _angleTriplePath(anglePoint, length1, length2);
  }

  static Path line(Line line) {
    return _linePath(line);
  }

  static Path smoothShape(List<Offset> points, {double cornerRadius = 4.0}) {
    return _closedPath(points, cornerRadius: cornerRadius);
  }

  static Path sharpShape(List<Offset> points) {
    return _closedSharpPath(points);
  }
}

extension RectExtra on Rect {
  Path get path {
    return PathExtra.rect(this);
  }

  Path pathWithCorner(
      {double? topLeftCorner,
      double? topRightCorner,
      double? bottomLeftCorner,
      double? bottomRightCorner,
      double? allCorners,
      double? leftCorners,
      double? rightCorners,
      double? topCorners,
      double? bottomCorners}) {
    return PathExtra.rrect(
      this,
      topLeftCorner: topLeftCorner,
      topRightCorner: topRightCorner,
      bottomLeftCorner: bottomLeftCorner,
      bottomRightCorner: bottomRightCorner,
      allCorners: allCorners,
      leftCorners: leftCorners,
      rightCorners: rightCorners,
      topCorners: topCorners,
      bottomCorners: bottomCorners,
    );
  }
}

extension LineExtra on List<Offset> {
  Path linePath({double? cornerRadius}) {
    return cornerRadius == null
        ? _openSharpPath(this)
        : PathExtra.line(Line(points: this, smoothLevel: cornerRadius));
  }

  Path polygonPath({double? cornerRadius}) {
    return cornerRadius == null
        ? PathExtra.sharpShape(this)
        : PathExtra.smoothShape(this, cornerRadius: cornerRadius);
  }
}
