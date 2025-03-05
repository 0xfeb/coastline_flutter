import 'package:flutter/material.dart';

/// >>> 从TextSpan列表生成RichText >>>
/// 从TextSpan列表生成RichText的扩展方法
///
/// 示例：
/// ```dart
/// [TextSpan(text:'Hello'), TextSpan(text:'World')].richText()
/// ```
extension RichTextList on List<TextSpan> {
  /// 生成RichText组件
  ///
  /// @param textAlign 文本对齐方式（默认起始对齐）
  /// @param textDirection 文本方向（可选）
  /// @param softWrap 是否自动换行（默认true）
  /// @param overflow 文本溢出处理方式（默认裁剪）
  /// @param textScaler 文本缩放比例（默认1.0）
  /// @param maxLines 最大行数（可选）
  /// @param locale 区域设置（可选）
  /// @return 配置完成的RichText组件
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
