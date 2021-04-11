import 'package:flutter/material.dart';

import 'line.dart';

/// >>> 组合Path >>>
Path pathUnion(Path path1, Path path2) {
  return Path.combine(PathOperation.union, path1, path2);
}

/// >>> 在Path上挖洞 >>>
Path pathHole(Path path1, Path path2) {
  return Path.combine(PathOperation.difference, path1, path2);
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

/// >>> 线中取一个偏移点(从0.0到1.0) >>>
Offset offsetOfLine(Offset point1, Offset point2, double offset) {
  final x = (point2.dx - point1.dx) * offset + point1.dx;
  final y = (point2.dy - point1.dy) * offset + point1.dy;
  return Offset(x, y);
}

/// >>> 线中取一个偏移点(大于0, 是point1这边偏移, 小于0, 是point2这边偏移) >>>
Offset positionOfLine(Offset point1, Offset point2, double position) {
  final distance = (point2 - point1).distance;
  double offset = 0;
  if (position >= 0) {
    offset = position / distance;
  } else {
    offset = (distance + position) / distance;
  }
  return offsetOfLine(point1, point2, offset);
}

/// >>> 多个点形成一个封闭的形状, 并且支持圆角功能 >>>
Path closedPath(List<Offset> points, {double cornerRadius = 4.0}) {
  Path path = Path();
  Offset a;
  Offset b;
  Offset ap;
  Offset bp;
  Offset first;
  Offset firstP;
  for (int i = 0; i < points.length; ++i) {
    a = points[i];
    b = (i == points.length - 1) ? points[0] : points[i + 1];
    bp = positionOfLine(a, b, -cornerRadius);
    ap = positionOfLine(a, b, cornerRadius);

    if (i == 0) {
      path.moveTo(ap.dx, ap.dy);
      first = a;
      firstP = ap;
    } else {
      path.quadraticBezierTo(a.dx, a.dy, ap.dx, ap.dy);
    }

    path.lineTo(bp.dx, bp.dy);
  }

  Offset lastP = positionOfLine(a, first, -cornerRadius);
  path.lineTo(lastP.dx, lastP.dy);
  path.quadraticBezierTo(first.dx, first.dy, firstP.dx, firstP.dy);

  return path;
}

/// >>> 多个点形成一个封闭的形状, 不支持圆角功能 >>>
Path closedSharpPath(List<Offset> points) {
  Path path = Path();
  path.moveTo(points.first.dx, points.first.dy);
  for (Offset point in points) {
    path.lineTo(point.dx, point.dy);
  }
  path.close();
  return path;
}

/// >>> 多个点形成一个线条, 并且支持圆角功能 >>>
Path linePath(Line line) {
  Path path = Path();
  Offset start = line.points.first;
  Offset startP;
  Offset nextP;
  Offset next;

  path.moveTo(start.dx, start.dy);

  for (int i = 1; i < line.points.length; ++i) {
    next = line.points[i];
    startP = positionOfLine(start, next, -line.smoothLevel);
    nextP = positionOfLine(start, next, line.smoothLevel);

    path.quadraticBezierTo(start.dx, start.dy, nextP.dx, nextP.dy);

    if (i == line.points.length - 1) {
      path.lineTo(next.dx, next.dy);
    } else {
      path.lineTo(nextP.dx, nextP.dy);
    }

    start = next;
  }

  return path;
}
