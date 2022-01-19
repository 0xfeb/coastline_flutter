import 'package:flutter/material.dart';

/// >>> 绘制文本的边框 >>>
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
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
    );
  }
}
