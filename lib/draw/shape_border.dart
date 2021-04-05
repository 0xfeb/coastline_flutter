import 'package:flutter/material.dart';

import 'path_extra.dart';

/// >>> 对话框边框 >>>
class ChatPopBorder extends ShapeBorder {
  final double offset;
  final Size arrowSize;

  ChatPopBorder({
    this.offset = 0.8,
    this.arrowSize = const Size(10, 10),
  });

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
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
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path a = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(rect.left, rect.top, rect.size.width,
              rect.size.height - arrowSize.height),
          Radius.circular(4),
        ),
      );

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
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
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
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    List<Offset> pointList = [
      Offset(rect.height, 0),
      Offset(rect.width, 0),
      Offset(rect.width, rect.height),
      Offset(rect.height, rect.height),
    ];
    return closedPath(pointList, cornerRadius: 8.0);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    List<Offset> pointList = [
      Offset(0, rect.height / 2),
      Offset(rect.height / 2, 0),
      Offset(rect.width, 0),
      Offset(rect.width, rect.height),
      Offset(rect.height / 2, rect.height),
    ];
    Path path1 = closedPath(pointList, cornerRadius: 8.0);
    Path path2 =
        cyclePath(Offset(rect.height / 2, rect.height / 2), rect.height / 4);
    Path path = pathHole(path1, path2);
    return path.shift(Offset(rect.left, rect.top));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

// todo: ticketBorder
class TicketBorder extends ShapeBorder {
  final Color color;

  TicketBorder({this.color});

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

// todo: receiptBoder
class FullReceiptBorder extends ShapeBorder {
  final Color color;

  FullReceiptBorder({this.color});

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

class TopReceiptBorder extends ShapeBorder {
  final Color color;

  TopReceiptBorder({this.color});

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

class BottomReceiptBorder extends ShapeBorder {
  final Color color;

  BottomReceiptBorder({this.color});

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(1);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

/// >>> 对话框边框 >>>
ChatPopBorder chatPopBorder({
  double offset = 0.8,
  Size arrowSize = const Size(10, 10),
}) {
  return ChatPopBorder(offset: offset, arrowSize: arrowSize);
}

/// >>> 圆角矩形边框 >>>
RoundedRectangleBorder rrectBorder({double radius = 4}) {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
}
