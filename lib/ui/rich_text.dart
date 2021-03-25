import 'package:flutter/material.dart';

extension RichTextExtra on RichText {
  /// >>> 从TextSpan列表生成RichText >>>
  static RichText formList(List<TextSpan> list,
      {TextAlign textAlign = TextAlign.start,
      TextDirection textDirection,
      bool softWrap = true,
      TextOverflow overflow = TextOverflow.clip,
      double textScaleFactor = 1.0,
      int maxLines,
      Locale locale,
      StrutStyle strutStyle,
      TextWidthBasis textWidthBasis = TextWidthBasis.parent,
      TextHeightBehavior textHeightBehavior}) {
    return RichText(
      text: TextSpan(text: '', children: list),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
