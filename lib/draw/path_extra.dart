import 'dart:math';

import 'package:flutter/material.dart';

extension PathExtra on Path {
  /// >>> 组合Path >>>
  Path union(Path path) {
    return Path.combine(PathOperation.union, this, path);
  }

  /// >>> 在Path上挖洞 >>>
  Path hole(Path path) {
    return Path.combine(PathOperation.difference, this, path);
  }
}

/// >>> 矩形Path >>>
Path rectPath(Rect rect) {
  return Path()..addRect(rect);
}

/// >>> 圆角矩形Path >>>
Path rrectPath(Rect rect,
    {double topLeftCorner,
    double topRightCorner,
    double bottomLeftCorner,
    double bottomRightCorner,
    double allCorners,
    double leftCorners,
    double rightCorners,
    double topCorners,
    double bottomCorners}) {
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
Path cyclePath(Offset center, double radius) {
  Rect rect = Rect.fromCenter(center: center, width: radius, height: radius);
  return Path()..addOval(rect);
}

/// >>> 三角形Path >>>
Path triplePath(Offset a, Offset b, Offset c) {
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
Path angleTriplePath(Offset anglePoint, double x, double y) {
  return triplePath(
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
