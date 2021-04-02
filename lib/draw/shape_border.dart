import 'package:flutter/material.dart';

/// >>> 对话框边框 >>>
class ChatPopBorder extends ShapeBorder {
  final double offset;
  final Size arrowSize;
  final Color color;

  ChatPopBorder({
    this.color = Colors.grey,
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

// todo: tagBorder
class TagBorder extends ShapeBorder {
  final Color color;

  TagBorder({this.color});

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
  Color color = Colors.grey,
  double offset = 0.8,
  Size arrowSize = const Size(10, 10),
}) {
  return ChatPopBorder(color: color, offset: offset, arrowSize: arrowSize);
}

/// >>> 圆角矩形边框 >>>
RoundedRectangleBorder rrectBorder({double radius = 4}) {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
}
