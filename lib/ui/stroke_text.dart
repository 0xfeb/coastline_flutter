import 'package:flutter/cupertino.dart';

/// >>> 绘制文本的边框 >>>
class StrokeText extends StatelessWidget {
  final StrokeCap strokeCap;
  final StrokeJoin strokeJoin;
  final double strokeWidth;
  final Color strokeColor;
  final TextStyle style;
  final String text;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior textHeightBehavior;

  const StrokeText(this.text,
      {Key key,
      this.strokeCap,
      this.strokeJoin,
      this.strokeWidth,
      this.strokeColor,
      this.style,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = strokeCap
      ..strokeJoin = strokeJoin
      ..strokeWidth = strokeWidth
      ..color = strokeColor;

    TextStyle currentStyle = style == null
        ? TextStyle(foreground: paint)
        : style.copyWith(foreground: paint);

    return Text(
      text,
      style: currentStyle,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
