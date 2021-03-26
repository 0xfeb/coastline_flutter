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
