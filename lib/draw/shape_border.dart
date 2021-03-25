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
    return Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(4)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path a = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
              0, 0, rect.size.width, rect.size.height - arrowSize.height),
          Radius.circular(4),
        ),
      );

    Offset p1 =
        Offset(rect.size.width * offset, rect.size.height - arrowSize.height);
    Offset p2 = Offset(
        rect.size.width * offset - arrowSize.width / 2, rect.size.height);
    Offset p3 = Offset(rect.size.width * offset - arrowSize.width,
        rect.size.height - arrowSize.height);
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
    return this;
  }
}

/// >>> 形状边框 >>>
extension ShapeBorderExtra on ShapeBorder {
  /// >>> 对话框边框 >>>
  static ChatPopBorder chatPop({
    Color color = Colors.grey,
    double offset = 0.8,
    Size arrowSize = const Size(10, 10),
  }) {
    return ChatPopBorder(color: color, offset: offset, arrowSize: arrowSize);
  }

  /// >>> 圆形矩形边框 >>>
  static RoundedRectangleBorder rrect({double radius = 4}) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }
}
