import 'package:flutter/material.dart';

class GlassPainter extends BoxPainter {
  final double width;
  final double height;

  GlassPainter({required this.width, required this.height});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Path path = Path()
      ..moveTo(offset.dx, offset.dy + height * 2 / 3)
      ..conicTo(offset.dx + width / 2, offset.dy + height / 3,
          offset.dx + width, offset.dy + height / 3, 1)
      ..lineTo(offset.dx + width, offset.dy + height)
      ..lineTo(offset.dx, offset.dy + height)
      ..close();

    canvas.drawPath(
        path,
        Paint()
          ..color = Color.fromARGB(50, 100, 100, 100)
          ..strokeWidth = 2);
  }
}

class GalssDecoration extends Decoration {
  final double width;
  final double height;

  GalssDecoration({required this.width, required this.height});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return GlassPainter(width: width, height: height);
  }
}

extension GlassBox on Widget {
  LayoutBuilder glassBox(
      {Color? color,
      EdgeInsets? padding,
      double borderSize = 1,
      Color borderColor = Colors.black,
      double? cornerRadius}) {
    return LayoutBuilder(builder: (context, constraints) {
      BoxDecoration decoration = BoxDecoration(
        color: color,
        borderRadius:
            cornerRadius != null ? BorderRadius.circular(cornerRadius) : null,
        border: Border.all(width: borderSize, color: borderColor),
      );
      return Container(
        child: this,
        padding: padding,
        decoration: decoration,
        foregroundDecoration: GalssDecoration(
            width: constraints.maxWidth, height: constraints.maxHeight),
      );
    });
  }
}
