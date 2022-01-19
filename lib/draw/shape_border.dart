import 'package:flutter/material.dart';

import 'path_extra.dart';

/// >>> 对话框边框 >>>
class ChatPopBorder extends ShapeBorder {
  final double offset;
  final Size arrowSize;
  final double? position;

  ChatPopBorder({
    this.offset = 0.8,
    this.arrowSize = const Size(10, 10),
    this.position,
  });

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(rect.left, rect.top, rect.size.width,
              rect.size.height - arrowSize.height),
          Radius.circular(4),
        ),
      );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path a = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(rect.left, rect.top, rect.size.width,
              rect.size.height - arrowSize.height),
          Radius.circular(4),
        ),
      );

    double offset = this.offset;
    if (position != null) {
      if (position! >= 0) {
        offset = position! / rect.size.width;
      } else {
        offset = (rect.size.width + position!) / rect.size.width;
      }
    }

    Offset p1 = Offset(rect.size.width * offset + rect.left,
        rect.size.height - arrowSize.height + rect.top);
    Offset p2 = Offset(
        rect.size.width * offset - arrowSize.width / 2 + rect.left,
        rect.size.height + rect.top);
    Offset p3 = Offset(rect.size.width * offset - arrowSize.width + rect.left,
        rect.size.height - arrowSize.height + rect.top);
    Path b = Path()..addPolygon([p1, p2, p3], true);

    return Path.combine(PathOperation.xor, a, b);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..strokeWidth = 0;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

// todo: tagBorder
class TagBorder extends ShapeBorder {
  TagBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    List<Offset> pointList = [
      Offset(rect.height, 0),
      Offset(rect.width, 0),
      Offset(rect.width, rect.height),
      Offset(rect.height, rect.height),
    ];
    return PathExtra.smoothShape(pointList, cornerRadius: 8.0);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    List<Offset> pointList = [
      Offset(0, rect.height / 2),
      Offset(rect.height / 2, 0),
      Offset(rect.width, 0),
      Offset(rect.width, rect.height),
      Offset(rect.height / 2, rect.height),
    ];
    Path path1 = PathExtra.smoothShape(pointList, cornerRadius: 8.0);
    Path path2 = PathExtra.cycle(
        center: Offset(rect.height / 2, rect.height / 2),
        radius: rect.height / 4);
    Path path = path1.hole(path2);
    return path.shift(Offset(rect.left, rect.top));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..strokeWidth = 0;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

/// >>> 电影票据类型的边框 >>>
class TicketBorder extends ShapeBorder {
  final double cutSize;

  TicketBorder({this.cutSize = 10.0});

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return PathExtra.rect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path1 = PathExtra.rect(Rect.fromLTWH(0, 0, rect.width, rect.height));
    double n = (rect.height - cutSize / 2) / (3 * cutSize / 2);
    int np = n.toInt();
    for (int i = 1; i <= np; ++i) {
      Path oPath1 = PathExtra.cycle(
          center: Offset(0, cutSize * 1.5 * i), radius: cutSize);
      path1 = path1.hole(oPath1);
      Path oPath2 = PathExtra.cycle(
          center: Offset(rect.width, cutSize * 1.5 * i), radius: cutSize);
      path1 = path1.hole(oPath2);
    }
    return path1.shift(Offset(rect.left, rect.top));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..strokeWidth = 0;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

List<double> _randomList(double limit, int count) {
  //Random r = Random();
  List<double> result = [0];
  double unit = limit / count.toDouble();
  for (int i = 1; i < count; ++i) {
    final c = i * unit;
    if (result.contains(c)) {
      i -= 1;
      continue;
    }
    result.add(c);
  }
  result.add(limit);
  return result;
}

List<Offset> _randomPoints(
    {required double limit, required int count, double height = 10}) {
  List<double> points = _randomList(limit, count);
  List<Offset> result = [];
  for (int i = 0; i < points.length; ++i) {
    if (i % 2 == 0) {
      result.add(Offset(points[i], 0));
    } else {
      result.add(Offset(points[i], height));
    }
  }
  return result;
}

/// >>> 单据边框, 上下都带有锯齿 >>>
class FullReceiptBorder extends ShapeBorder {
  FullReceiptBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return PathExtra.rect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    List<Offset> points = _randomPoints(limit: rect.width, count: 30);
    List<Offset> bottomPoints = _randomPoints(limit: rect.width, count: 30)
        .reversed
        .map((e) => e.translate(0, rect.height - 10))
        .toList();
    points.addAll(bottomPoints);
    return PathExtra.sharpShape(points).shift(Offset(rect.left, rect.top));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..strokeWidth = 0;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

/// >>> 票据边框, 上部带有锯齿 >>>
class TopReceiptBorder extends ShapeBorder {
  TopReceiptBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return PathExtra.rect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    List<Offset> points = _randomPoints(limit: rect.width, count: 30);
    points.add(Offset(rect.width, rect.height));
    points.add(Offset(0, rect.height));
    return PathExtra.sharpShape(points).shift(Offset(rect.left, rect.top));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..strokeWidth = 0;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

/// >>> 票据边框, 下方带有锯齿 >>>
class BottomReceiptBorder extends ShapeBorder {
  BottomReceiptBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return PathExtra.rect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    List<Offset> points = _randomPoints(limit: rect.width, count: 30)
        .reversed
        .map((e) => e.translate(0, rect.height - 10))
        .toList();
    points.add(Offset(0, 0));
    points.add(Offset(rect.width, 0));
    return PathExtra.sharpShape(points).shift(Offset(rect.left, rect.top));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..strokeWidth = 0;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

/// >>> 圆角矩形边框 >>>
RoundedRectangleBorder rRectBorder({double radius = 4}) {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
}
