import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../draw/line.dart';
import '../draw/path_extra.dart';

class HelpItem {
  final String text;
  final Offset arrowPoint;
  final Offset endPoint;
  final Color color;

  HelpItem(
      {this.color = Colors.white, this.text, this.arrowPoint, this.endPoint});
}

extension CanvasHelp on Canvas {
  drawHelpItem(HelpItem item) {
    Paint paint = Paint()
      ..color = item.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    bool upArrow = item.endPoint.dy < item.arrowPoint.dy;
    Offset arrowPoint1 = Offset(item.arrowPoint.dx - 5,
        upArrow ? item.arrowPoint.dy - 5 : item.arrowPoint.dy + 5);
    Offset arrowPoint2 = Offset(item.arrowPoint.dx + 5,
        upArrow ? item.arrowPoint.dy - 5 : item.arrowPoint.dy + 5);
    this.drawLine(arrowPoint1, item.arrowPoint, paint);
    this.drawLine(arrowPoint2, item.arrowPoint, paint);

    Offset center1 =
        Offset(item.endPoint.dx, (item.endPoint.dy + item.arrowPoint.dy) / 2);
    Offset center2 =
        Offset(item.arrowPoint.dx, (item.endPoint.dy + item.arrowPoint.dy) / 2);

    Line line =
        Line(points: [item.endPoint, center1, center2, item.arrowPoint]);
    Path path = linePath(line);

    this.drawPath(path, paint);

    ui.ParagraphBuilder pb =
        ui.ParagraphBuilder(ui.ParagraphStyle(fontSize: 18));
    pb.pushStyle(ui.TextStyle(color: Colors.white));
    pb.addText(item.text);
    this.drawParagraph(
        pb.build(),
        upArrow
            ? Offset(max(10, item.endPoint.dx - 10), item.endPoint.dy + 20)
            : Offset(max(10, item.endPoint.dx - 10), item.endPoint.dy - 20));
  }
}
