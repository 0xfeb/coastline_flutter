import 'package:flutter/material.dart';

/// 玻璃效果绘制器
///
/// 使用圆锥曲线创建具有透明效果的波浪形顶部边框
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

  /// 玻璃效果装饰器
  ///
  /// [width] 容器宽度
  /// [height] 容器高度
  GalssDecoration({required this.width, required this.height});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return GlassPainter(width: width, height: height);
  }
}

/// 为Widget添加玻璃效果扩展
///
/// [color] 背景颜色
/// [padding] 内边距
/// [borderSize] 边框尺寸（默认1）
/// [borderColor] 边框颜色（默认黑色）
/// [cornerRadius] 圆角半径
///
/// 返回带有前景玻璃效果的布局构建器
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
