import 'package:flutter/material.dart';

/// >>> 从TextSpan列表生成RichText >>>
extension RichTextList on List<TextSpan> {
  RichText richText({
    TextAlign textAlign = TextAlign.start,
    TextDirection? textDirection,
    bool softWrap = true,
    TextOverflow overflow = TextOverflow.clip,
    double textScaler = 1.0,
    int? maxLines,
    Locale? locale,
  }) {
    return RichText(
      text: TextSpan(text: '', children: this),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: TextScaler.linear(textScaler),
      maxLines: maxLines,
      locale: locale,
    );
  }
}
