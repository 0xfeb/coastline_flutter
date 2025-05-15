import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 隐式动画, 必须在属性上设置一个随着变量变化的值, 比如judge?a:b, 然后在setState中修改judge.

/// 为Align组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [animateValueForAlignment] 对齐方式数值, 随着时间变动。
/// [heightFactor] 高度因子，默认为1.0。
/// [widthFactor] 宽度因子，默认为1.0。
///
/// 返回一个AnimatedAlign组件。
extension AlignAniExt on Widget {
  AnimatedAlign animatedAlign(
      {Curve curve = Curves.linear,
      required Alignment animateValueForAlignment,
      Duration duration = const Duration(milliseconds: 300),
      double heightFactor = 1.0,
      double widthFactor = 1.0,
      VoidCallback? onEnd}) {
    return AnimatedAlign(
        key: key,
        alignment: animateValueForAlignment,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: this);
  }
}

/// 为Container组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [width] 容器宽度, 可以用于动画。
/// [height] 容器高度, 可以用于动画。
/// [constraints] 容器约束条件, 可以用于动画。
/// [padding] 内边距, 可以用于动画。
/// [margin] 外边距, 可以用于动画。
/// [decoration] 装饰效果, 可以用于动画。
/// [foregroundDecoration] 前景装饰效果, 可以用于动画。
/// [alignment] 对齐方式, 可以用于动画。
///
/// 返回一个AnimatedContainer组件。
extension ContainerAniExt on Widget {
  AnimatedContainer animatedContainer(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      BoxConstraints? constraints,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      Decoration? decoration,
      Decoration? foregroundDecoration,
      AlignmentGeometry? alignment,
      VoidCallback? onEnd,
      double? width,
      double? height}) {
    return AnimatedContainer(
        key: key,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        alignment: alignment,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        constraints: constraints,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: this);
  }
}

/// 为DefaultTextStyle组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [textStyle] 文本样式, 可以用于动画。
/// [textAlign] 文本对齐方式, 可以用于动画。
/// [softWrap] 是否自动换行, 可以用于动画。
/// [overflow] 文本溢出处理方式, 可以用于动画。
/// [maxLines] 最大行数, 可以用于动画。
/// [textWidthBasis] 文本宽度基准, 可以用于动画。
/// [textHeightBehavior] 文本高度行为, 可以用于动画。
///
/// 返回一个AnimatedDefaultTextStyle组件。
extension DefTextStyleExt on Widget {
  AnimatedDefaultTextStyle animatedDefaultTextStyle(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      TextStyle textStyle = const TextStyle(),
      TextAlign? textAlign,
      bool softWrap = true,
      TextOverflow? overflow,
      int? maxLines,
      TextWidthBasis? textWidthBasis,
      TextHeightBehavior? textHeightBehavior,
      VoidCallback? onEnd}) {
    return AnimatedDefaultTextStyle(
        key: key,
        style: textStyle,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow ?? TextOverflow.clip,
        maxLines: maxLines,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        textHeightBehavior: textHeightBehavior,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: this);
  }
}

/// 为Opacity组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [opacity] 透明度，范围为0.0到1.0。
/// [alwaysIncludeSemantics] 是否总是包含语义信息。
///
/// 返回一个AnimatedOpacity组件。
extension OpacityExt on Widget {
  AnimatedOpacity animatedOpacity(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      required double opacity,
      bool alwaysIncludeSemantics = false,
      VoidCallback? onEnd}) {
    return AnimatedOpacity(
        key: key,
        opacity: opacity,
        curve: curve,
        duration: duration,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        onEnd: onEnd,
        child: this);
  }
}

/// 为Padding组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [padding] 内边距, 可以用于动画。
///
/// 返回一个AnimatedPadding组件。
extension PandingExt on Widget {
  AnimatedPadding animatedPadding(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      required EdgeInsetsGeometry padding,
      VoidCallback? onEnd}) {
    return AnimatedPadding(
        key: key,
        padding: padding,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: this);
  }
}

/// 为Positioned组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [left] 左侧位置, 可以用于动画。
/// [top] 顶部位置, 可以用于动画。
/// [right] 右侧位置, 可以用于动画。
/// [bottom] 底部位置, 可以用于动画。
/// [width] 宽度, 可以用于动画。
/// [height] 高度, 可以用于动画。
///
/// 返回一个AnimatedPositioned组件。
extension PositionedExt on Widget {
  AnimatedPositioned animatedPosition(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      double? left,
      double? top,
      double? right,
      double? bottom,
      double? width,
      double? height,
      VoidCallback? onEnd}) {
    return AnimatedPositioned(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        curve: curve,
        width: width,
        height: height,
        duration: duration,
        onEnd: onEnd,
        child: this);
  }
}

/// 为Theme组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为kThemeAnimationDuration。
/// [onEnd] 动画结束时的回调函数。
/// [themeData] 主题数据。
///
/// 返回一个AnimatedTheme组件。
extension ThemeExt on Widget {
  AnimatedTheme animatedTheme(
      {Curve curve = Curves.linear,
      Duration duration = kThemeAnimationDuration,
      required ThemeData themeData,
      VoidCallback? onEnd}) {
    return AnimatedTheme(
        key: key,
        data: themeData,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: this);
  }
}

/// 为PhysicalModel组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [color] 物理模型的颜色。
/// [borderRadius] 边框圆角半径，默认为5.0。
/// [clipBehavior] 剪裁行为，默认为Clip.none。
/// [elevation] 阴影高度，默认为0。
/// [shadowColor] 阴影颜色，默认为灰色。
/// [shape] 形状，默认为BoxShape.rectangle。
///
/// 返回一个AnimatedPhysicalModel组件。
extension PhysicalModelExt on Widget {
  AnimatedPhysicalModel animatedPhysicalModel(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd,
      required Color color,
      double borderRadius = 5.0,
      Clip clipBehavior = Clip.none,
      double elevation = 0,
      Color shadowColor = Colors.grey,
      BoxShape shape = BoxShape.rectangle}) {
    return AnimatedPhysicalModel(
        key: key,
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        clipBehavior: clipBehavior,
        shape: shape,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        elevation: elevation,
        shadowColor: shadowColor,
        child: this);
  }
}

/// 为Widget添加缩放动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [scale] 缩放比例。
/// [alignment] 对齐方式，默认为Alignment.center。
/// [filterQuality] 过滤质量。
///
/// 返回一个AnimatedScale组件。
extension AnimateExt on Widget {
  animatedScale(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd,
      required double scale,
      Alignment alignment = Alignment.center,
      FilterQuality? filterQuality}) {
    return AnimatedScale(
        key: key,
        scale: scale,
        alignment: alignment,
        filterQuality: filterQuality,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: this);
  }

  /// 为Widget添加Tween动画效果。其它隐形动画是将从当前值开始动画到目标值，而Tween动画则是从begin值开始动画到end值, 这样比起其他隐形动画更加精准控制.
  ///
  /// [begin] 动画开始值。
  /// [end] 动画结束值。
  /// [duration] 动画持续时间，单位为毫秒。
  /// [curve] 动画曲线，默认为线性。
  /// [parentBuilder] 父组件构建器。
  /// [key] 键。
  /// [onEnd] 动画结束时的回调函数。
  ///
  /// 返回一个TweenAnimationBuilder组件。
  TweenAnimationBuilder animatedTween<T>(
      {required T begin,
      required T end,
      required int duration,
      Curve curve = Curves.linear,
      required ValueWidgetBuilder<Object?> parentBuilder,
      Key? key,
      VoidCallback? onEnd}) {
    return TweenAnimationBuilder(
      key: key,
      tween: Tween(begin: begin, end: end),
      duration: Duration(milliseconds: duration),
      curve: curve,
      builder: parentBuilder,
      onEnd: onEnd,
      child: this,
    );
  }

  /// 为Widget添加旋转动画效果。
  ///
  /// [curve] 动画曲线，默认为线性。
  /// [duration] 动画持续时间，默认为300毫秒。
  /// [onEnd] 动画结束时的回调函数。
  /// [degree] 旋转角度。
  /// [alignment] 对齐方式，默认为Alignment.center。
  /// [filterQuality] 过滤质量。
  ///
  /// 返回一个AnimatedRotation组件。
  AnimatedRotation animatedRotate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd,
      required double degree,
      Alignment alignment = Alignment.center,
      FilterQuality? filterQuality}) {
    return AnimatedRotation(
        key: key,
        turns: degree / 360,
        curve: curve,
        duration: duration,
        alignment: alignment,
        filterQuality: filterQuality,
        onEnd: onEnd,
        child: this);
  }

  /// 为Widget添加滑动动画效果。
  ///
  /// [curve] 动画曲线，默认为线性。
  /// [duration] 动画持续时间，默认为300毫秒。
  /// [onEnd] 动画结束时的回调函数。
  /// [offset] 滑动偏移量。
  ///
  /// 返回一个AnimatedSlide组件。
  AnimatedSlide animatedMove(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd,
      required Offset offset}) {
    return AnimatedSlide(
        key: key,
        curve: curve,
        duration: duration,
        offset: offset,
        onEnd: onEnd,
        child: this);
  }
}

//   /// 为Widget添加大小动画效果。animatedScale是动画缩放, 这个是动画更改大小.
//   ///
//   /// [curve] 动画曲线，默认为线性。
//   /// [alignment] 对齐方式，默认为Alignment.center。
//   /// [duration] 动画持续时间，默认为300毫秒。
//   /// [reverseDuration] 反向动画持续时间。
//   /// [clipBehavior] 剪裁行为，默认为Clip.hardEdge。
//   ///
//   /// 返回一个AnimatedSize组件。
//   AnimatedSize animatedFitChildren(
//       {Curve curve = Curves.linear,
//       Alignment alignment = Alignment.center,
//       Duration duration = const Duration(milliseconds: 300),
//       Duration? reverseDuration,
//       Clip clipBehavior = Clip.hardEdge}) {
//     return AnimatedSize(
//         key: key,
//         curve: curve,
//         duration: duration,
//         alignment: alignment,
//         reverseDuration: reverseDuration,
//         clipBehavior: clipBehavior,
//         child: this);
//   }
// }

extension AnimateExt2 on List<Widget> {
  /// 为两个Widget添加交叉淡入淡出动画效果。
  ///
  /// [duration] 动画持续时间，默认为300毫秒。
  /// [showNext] 是否显示第二个Widget。
  ///
  /// 返回一个AnimatedCrossFade组件。
  AnimatedCrossFade animatedCrossFade({
    Duration duration = const Duration(milliseconds: 300),
    required bool showNext,
  }) {
    if (this.length < 2) {
      throw Exception('AnimatedCrossFade need 2 children');
    }

    return AnimatedCrossFade(
      duration: duration,
      firstChild: this[0],
      secondChild: this[1],
      crossFadeState:
          showNext ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }

  /// 为多个Widget添加尺寸变化动画效果
  ///
  /// [curve] 动画曲线，默认为线性。
  /// [alignment] 对齐方式，默认为Alignment.center。
  /// [duration] 动画持续时间，默认为300毫秒。
  /// [reverseDuration] 反向动画持续时间。
  /// [clipBehavior] 剪裁行为，默认为Clip.hardEdge。
  /// [index] 准备显示第几个widget。
  ///
  /// 返回一个AnimatedSize组件。
  AnimatedSize animatedFitChild({
    Curve curve = Curves.linear,
    Alignment alignment = Alignment.center,
    Duration duration = const Duration(milliseconds: 300),
    Duration? reverseDuration,
    required int index,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return AnimatedSize(
      curve: curve,
      duration: duration,
      alignment: alignment,
      reverseDuration: reverseDuration,
      clipBehavior: clipBehavior,
      child: this[index],
    );
  }
}
