import 'package:flutter/widgets.dart';

/// 为文本添加边框效果的装饰组件
///
/// 通过叠加两个文本实现边框效果：底层文本使用描边样式，上层保留原始文本
class BorderedText extends StatelessWidget {
  /// 创建带边框的文本组件
  ///
  /// [child]：要应用边框效果的原始文本组件（必须包含style属性）
  /// [strokeCap]：线段末端的绘制样式，可选butt/round/square，默认round
  /// [strokeJoin]：线段连接处的绘制样式，可选miter/round/bevel，默认round
  /// [strokeWidth]：边框宽度（单位：逻辑像素），默认6.0
  /// [strokeColor]：边框颜色，默认值Color.fromRGBO(53, 0, 71, 1)
  BorderedText({
    required this.child,
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.strokeWidth = 6.0,
    this.strokeColor = const Color.fromRGBO(53, 0, 71, 1),
  });

  /// 线段末端样式（详见Paint.strokeCap）
  final StrokeCap strokeCap;

  /// 线段连接样式（详见Paint.strokeJoin）
  final StrokeJoin strokeJoin;

  /// 边框线宽（单位：逻辑像素）
  final double strokeWidth;

  /// 边框颜色
  final Color strokeColor;

  /// 要添加边框的文本组件
  final Text child;

  /// 构建双重文本叠加效果
  ///
  /// 1. 复制原始文本样式并应用描边绘制属性
  /// 2. 使用Stack叠加：底层绘制描边文本，上层显示原始文本
  /// 3. 保持原始文本的所有布局属性（对齐方式、文字方向等）
  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (child.style != null) {
      style = child.style!.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
        color: null,
      );
    } else {
      style = TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
      );
    }
    return Stack(
      alignment: Alignment.center,
      textDirection: child.textDirection,
      children: <Widget>[
        Text(
          child.data ?? '',
          style: style,
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaler: child.textScaler,
        ),
        child,
      ],
    );
  }
}
