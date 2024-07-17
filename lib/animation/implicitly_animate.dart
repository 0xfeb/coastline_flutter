import 'package:flutter/material.dart';

// 隐式动画, 必须在属性上设置一个随着变量变化的值, 比如judge?a:b, 然后在setState中修改judge.

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

// 如果设置width和height, 会覆盖掉原控件的width和height
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

// extension PhysicalModelExt on PhysicalModel {
//   AnimatedPhysicalModel animate(
//       {Curve curve = Curves.linear,
//       Duration duration = const Duration(milliseconds: 300),
//       VoidCallback? onEnd,
//       required Color color,
//       BorderRadiusGeometry borderRadius = BorderRadius.zero,
//       Clip clipBehavior = Clip.none,
//       ShapeBorder shape = const RoundedRectangleBorder()}) {
//     return AnimatedPhysicalModel(
//         key: key,
//         color: color,
//         borderRadius: borderRadius,
//         clipBehavior: clipBehavior,
//         shape: shape,
//         curve: curve,
//         duration: duration,
//         onEnd: onEnd,
//         child: child);
//       }
// }

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

  // 直接通过隐式数据调整对象的size即可
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
