import 'package:flutter/material.dart';

// 隐式动画, 必须在属性上设置一个随着变量变化的值, 比如judge?a:b, 然后在setState中修改judge.

/// 为Align组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
///
/// 返回一个AnimatedAlign组件。
extension AlignAniExt on Align {
  AnimatedAlign animate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd}) {
    return AnimatedAlign(
        key: key,
        alignment: alignment,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: child);
  }
}

/// 为Container组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
/// [width] 容器宽度。
/// [height] 容器高度。
///
/// 返回一个AnimatedContainer组件。
extension ContainerAniExt on Container {
  AnimatedContainer animate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
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
        child: child);
  }
}

/// 为DefaultTextStyle组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
///
/// 返回一个AnimatedDefaultTextStyle组件。
extension DefTextStyleExt on DefaultTextStyle {
  AnimatedDefaultTextStyle animate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd}) {
    return AnimatedDefaultTextStyle(
        key: key,
        style: style,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: child);
  }
}

/// 为Opacity组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
///
/// 返回一个AnimatedOpacity组件。
extension OpacityExt on Opacity {
  AnimatedOpacity animate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd}) {
    return AnimatedOpacity(
        key: key,
        opacity: opacity,
        curve: curve,
        duration: duration,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        onEnd: onEnd,
        child: child);
  }
}

/// 为Padding组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
///
/// 返回一个AnimatedPadding组件。
extension PandingExt on Padding {
  AnimatedPadding animate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd}) {
    return AnimatedPadding(
        key: key,
        padding: padding,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: child);
  }
}

/// 为Positioned组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为300毫秒。
/// [onEnd] 动画结束时的回调函数。
///
/// 返回一个AnimatedPositioned组件。
extension PositionedExt on Positioned {
  AnimatedPositioned animate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
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
        child: child);
  }
}

/// 为Theme组件添加隐式动画效果。
///
/// [curve] 动画曲线，默认为线性。
/// [duration] 动画持续时间，默认为kThemeAnimationDuration。
/// [onEnd] 动画结束时的回调函数。
///
/// 返回一个AnimatedTheme组件。
extension ThemeExt on Theme {
  AnimatedTheme animate(
      {Curve curve = Curves.linear,
      Duration duration = kThemeAnimationDuration,
      VoidCallback? onEnd}) {
    return AnimatedTheme(
        key: key,
        data: data,
        curve: curve,
        duration: duration,
        onEnd: onEnd,
        child: child);
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
/// [child] 子组件。
///
/// 返回一个AnimatedPhysicalModel组件。
extension PhysicalModelExt on PhysicalModel {
  AnimatedPhysicalModel animate(
      {Curve curve = Curves.linear,
      Duration duration = const Duration(milliseconds: 300),
      VoidCallback? onEnd,
      required Color color,
      double borderRadius = 5.0,
      Clip clipBehavior = Clip.none,
      double elevation = 0,
      Color shadowColor = Colors.grey,
      BoxShape shape = BoxShape.rectangle,
      required Widget child}) {
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
        child: child);
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
  AnimatedScale scaleAnimation(
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

  /// 为Widget添加交叉渐变动画效果。
  ///
  /// [duration] 动画持续时间，单位为毫秒。
  /// [nextChild] 下一个子组件。
  /// [showNext] 是否显示下一个子组件。
  ///
  /// 返回一个AnimatedCrossFade组件。
  AnimatedCrossFade animationCrossFade({
    required int duration,
    required Widget nextChild,
    required bool showNext,
  }) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: duration),
      firstChild: this,
      secondChild: nextChild,
      crossFadeState:
          showNext ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }

  /// 为Widget添加Tween动画效果。
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
  TweenAnimationBuilder animatedParent<T>(
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
  AnimatedRotation rotationAnimation(
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
  AnimatedSlide moveAnimation(
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

  /// 为Widget添加大小动画效果。
  ///
  /// [curve] 动画曲线，默认为线性。
  /// [alignment] 对齐方式，默认为Alignment.center。
  /// [duration] 动画持续时间，默认为300毫秒。
  /// [reverseDuration] 反向动画持续时间。
  /// [clipBehavior] 剪裁行为，默认为Clip.hardEdge。
  ///
  /// 返回一个AnimatedSize组件。
  AnimatedSize sizeAnimation(
      {Curve curve = Curves.linear,
      Alignment alignment = Alignment.center,
      Duration duration = const Duration(milliseconds: 300),
      Duration? reverseDuration,
      Clip clipBehavior = Clip.hardEdge}) {
    return AnimatedSize(
        key: key,
        curve: curve,
        duration: duration,
        alignment: alignment,
        reverseDuration: reverseDuration,
        clipBehavior: clipBehavior,
        child: this);
  }
}
