import 'package:flutter/material.dart';

/// >>> 绘制文本的边框 >>>
/// 绘制带边框的文本组件
///
/// 通过自定义绘制实现文本描边效果，支持设置描边样式和文本属性
class StrokeText extends StatelessWidget {
  final StrokeCap strokeCap;
  final StrokeJoin strokeJoin;
  final double strokeWidth;
  final Color strokeColor;
  final TextStyle? style;
  final String text;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;

  /// 创建描边文本组件
  ///
  /// @param text 显示文本内容
  /// @param strokeCap 描边端点样式（默认圆形）
  /// @param strokeJoin 描边连接样式（默认圆形）
  /// @param strokeWidth 描边宽度（默认1.0）
  /// @param strokeColor 描边颜色（默认灰色）
  /// @param style 文本样式（可选）
  /// @param textAlign 文本对齐方式（可选）
  /// @param textDirection 文本方向（可选）
  /// @param locale 区域设置（可选）
  /// @param softWrap 是否自动换行（可选）
  /// @param overflow 文本溢出处理方式（可选）
  /// @param textScaleFactor 文本缩放因子（可选）
  /// @param maxLines 最大行数（可选）
  const StrokeText(this.text,
      {Key? key,
      this.strokeCap = StrokeCap.round,
      this.strokeJoin = StrokeJoin.round,
      this.strokeWidth = 1.0,
      this.strokeColor = Colors.grey,
      this.style,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines})
      : super(key: key);

  /// 构建描边文本组件
  ///
  /// @return 包含描边效果的Text组件
  @override
  Widget build(BuildContext context) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin = strokeJoin
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..color = strokeColor;

    TextStyle currentStyle = style == null
        ? TextStyle(foreground: paint)
        : style!.copyWith(foreground: paint);

    return Text(
      text,
      style: currentStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: TextScaler.linear(textScaleFactor ?? 1),
      maxLines: maxLines,
    );
  }
}
