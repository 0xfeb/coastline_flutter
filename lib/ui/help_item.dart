import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../draw/line.dart';
import '../draw/path_extra.dart';

/// 帮助提示项数据模型
///
/// 包含文本内容、箭头位置、终点位置和颜色属性
class HelpItem {
  final String? text;
  final Offset? arrowPoint;
  final Offset? endPoint;
  final Color color;

  /// 构造函数
  ///
  /// @param color 提示项颜色，默认白色
  /// @param text 显示的文字内容
  /// @param arrowPoint 箭头尖端的坐标位置
  /// @param endPoint 文本终点的坐标位置
  HelpItem(
      {this.color = Colors.white, this.text, this.arrowPoint, this.endPoint});
}

/// 画布帮助工具扩展
///
/// 提供在Canvas上绘制帮助提示项的功能
extension CanvasHelp on Canvas {
  /// 绘制完整的帮助提示项
  ///
  /// 实现步骤：
  /// 1. 创建基础绘制画笔
  /// 2. 绘制指示箭头
  /// 3. 生成平滑曲线路径
  /// 4. 布局并绘制文本内容
  ///
  /// @param item 要绘制的帮助项对象，必须包含有效的坐标和文本
  void drawHelpItem(HelpItem item) {
    Paint paint = Paint()
      ..color = item.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // 箭头方向判断（终点Y坐标小于箭头点Y坐标时为上箭头）
    bool upArrow = item.endPoint!.dy < item.arrowPoint!.dy;
    Offset arrowPoint1 = Offset(item.arrowPoint!.dx - 5,
        upArrow ? item.arrowPoint!.dy - 5 : item.arrowPoint!.dy + 5);
    Offset arrowPoint2 = Offset(item.arrowPoint!.dx + 5,
        upArrow ? item.arrowPoint!.dy - 5 : item.arrowPoint!.dy + 5);
    this.drawLine(arrowPoint1, item.arrowPoint!, paint);
    this.drawLine(arrowPoint2, item.arrowPoint!, paint);

    // 曲线控制点计算（取终点和箭头点的中间位置）
    Offset center1 = Offset(
        item.endPoint!.dx, (item.endPoint!.dy + item.arrowPoint!.dy) / 2);
    Offset center2 = Offset(
        item.arrowPoint!.dx, (item.endPoint!.dy + item.arrowPoint!.dy) / 2);
    Line line = Line(
        points: [item.endPoint!, center1, center2, item.arrowPoint!],
        smoothLevel: 20);
    Path path = PathExtra.line(line);

    this.drawPath(path, paint);

    // 文本段落构建与布局（限制宽度为200像素）
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
