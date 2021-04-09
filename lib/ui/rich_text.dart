import 'package:flutter/material.dart';

/// >>> 从TextSpan列表生成RichText >>>
RichText richTextFormList(
  List<TextSpan> list, {
  TextAlign textAlign = TextAlign.start,
  TextDirection textDirection,
  bool softWrap = true,
  TextOverflow overflow = TextOverflow.clip,
  double textScaleFactor = 1.0,
  int maxLines,
  Locale locale,
}) {
  return RichText(
    text: TextSpan(text: '', children: list),
    textAlign: textAlign,
    textDirection: textDirection,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    locale: locale,
  );
}
