import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 文本显示扩展方法
/// 
/// 提供多种预定义文本样式的快捷生成方式
extension TextDisplay on String {
  /// >>> 从字符串生成文本控件 >>>
  /// 生成基础文本组件
///
/// @param style 文本样式（可选）
/// @param strutStyle 支撑样式（可选）
/// @param textAlign 文本对齐方式（可选）
/// @param textDirection 文本方向（可选）
/// @param locale 区域设置（可选）
/// @param softWrap 是否自动换行（可选）
/// @param overflow 文本溢出处理方式（可选）
/// @param textScaleFactor 文本缩放因子（可选）
/// @param maxLines 最大行数（可选）
/// @param semanticsLabel 语义标签（可选）
/// @param textWidthBasis 文本宽度基准（可选）
/// @param textHeightBehavior 文本高度行为（可选）
/// @return 配置完成的Text组件
Text text(
      {Key? key,
      TextStyle? style,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextHeightBehavior? textHeightBehavior}) {
    return Text(this,
        style: style,
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
        textHeightBehavior: textHeightBehavior);
  }

  /// >>> 从字符串生成标题文本控件 >>>
  /// 生成标题文本组件
///
/// @param context 构建上下文
/// @return 使用主题标题样式的文本组件
Text textTitle(
      {Key? key,
      required BuildContext context,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextHeightBehavior? textHeightBehavior}) {
    return Text(this,
        style: Theme.of(context).textTheme.headlineSmall,
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
        textHeightBehavior: textHeightBehavior);
  }

  /// >>> 从字符串生成子标题文本控件 >>>
  /// 生成子标题文本组件
///
/// @param context 构建上下文
/// @return 使用主题子标题样式的文本组件
Text textSubtitle(
      {Key? key,
      required BuildContext context,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextHeightBehavior? textHeightBehavior}) {
    return Text(this,
        style: Theme.of(context).textTheme.titleSmall,
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
        textHeightBehavior: textHeightBehavior);
  }

  /// >>> 从字符串生成粗文本控件 >>>
  /// 生成加粗正文字体组件
///
/// @param context 构建上下文
/// @return 使用加粗正文字体的文本组件
Text textBodyBold(
      {Key? key,
      required BuildContext context,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextHeightBehavior? textHeightBehavior}) {
    return Text(this,
        style: Theme.of(context).textTheme.bodyMedium,
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
        textHeightBehavior: textHeightBehavior);
  }

  /// >>> 从字符串生成标准文本控件 >>>
  /// 生成常规正文字体组件
///
/// @param context 构建上下文
/// @return 使用常规正文字体的文本组件
Text textBodyNormal(
      {Key? key,
      required BuildContext context,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextHeightBehavior? textHeightBehavior}) {
    return Text(this,
        style: Theme.of(context).textTheme.bodyMedium,
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
        textHeightBehavior: textHeightBehavior);
  }

  /// >>> 从字符串生成按钮文本控件 >>>
  /// 生成操作按钮文本组件
///
/// @param context 构建上下文
/// @return 使用按钮字体的文本组件
Text textAction(
      {Key? key,
      required BuildContext context,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextHeightBehavior? textHeightBehavior}) {
    return Text(this,
        style: Theme.of(context).textTheme.labelMedium,
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
        textHeightBehavior: textHeightBehavior);
  }

  /// >>> 从字符串生成富文件组件 >>>
  /// 生成可交互的文本片段
///
/// @param style 文本样式（可选）
/// @param onTap 点击回调函数（可选）
/// @return 包含点击事件的TextSpan组件
TextSpan textSpan({
    TextStyle? style,
    Function onTap()?,
  }) {
    TapGestureRecognizer rec = TapGestureRecognizer();
    rec.onTap = onTap;
    return TextSpan(text: this, style: style, recognizer: rec);
  }
}
