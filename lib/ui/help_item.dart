import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../draw/line.dart';
import '../draw/path_extra.dart';

class HelpItem {
  final String? text;
  final Offset? arrowPoint;
  final Offset? endPoint;
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

    // 绘制箭头
    bool upArrow = item.endPoint!.dy < item.arrowPoint!.dy;
    Offset arrowPoint1 = Offset(item.arrowPoint!.dx - 5,
        upArrow ? item.arrowPoint!.dy - 5 : item.arrowPoint!.dy + 5);
    Offset arrowPoint2 = Offset(item.arrowPoint!.dx + 5,
        upArrow ? item.arrowPoint!.dy - 5 : item.arrowPoint!.dy + 5);
    this.drawLine(arrowPoint1, item.arrowPoint!, paint);
    this.drawLine(arrowPoint2, item.arrowPoint!, paint);

    // 绘制曲线
    Offset center1 =
        Offset(item.endPoint!.dx, (item.endPoint!.dy + item.arrowPoint!.dy) / 2);
    Offset center2 =
        Offset(item.arrowPoint!.dx, (item.endPoint!.dy + item.arrowPoint!.dy) / 2);
    Line line = Line(
        points: [item.endPoint, center1, center2, item.arrowPoint],
        smoothLevel: 20);
    Path path = linePath(line);

    this.drawPath(path, paint);

    // 绘制文本
    ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle());
    pb.pushStyle(ui.TextStyle(color: Colors.white, fontSize: 22));
    pb.addText(item.text!);
    pb.pop();
    ui.Paragraph pg = pb.build();
    pg.layout(ui.ParagraphConstraints(width: 200));
    print('item ${item.text} ${pg.width}');
    final textOffset = upArrow
        ? Offset(max(10, item.endPoint!.dx - 10), item.endPoint!.dy - 25)
        : Offset(max(10, item.endPoint!.dx - 10), item.endPoint!.dy);
    print('text offset $textOffset');
    this.drawParagraph(pg, textOffset);
  }
}
