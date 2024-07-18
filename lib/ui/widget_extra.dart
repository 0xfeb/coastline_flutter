import 'dart:math' as math;

import 'package:flutter/material.dart';

enum IntrinsicDirection {
  horizon,
  vertical,
  both,
}

extension WidgetExtra on Widget {
  /// >>> 点击控件 >>>
  InkWell onTap(Function() onTap) {
    return InkWell(
      enableFeedback: false,
      child: this,
      onTap: onTap,
    );
  }

  /// >>> 按下/释放控件 >>>
  Widget onPress(
      {Function()? onHold, Function()? onRelease, Function()? onFocusRelease}) {
    return GestureDetector(
      child: this,
      onTapDown: onHold == null ? null : (_) => onHold(),
      onTapUp: (_) {
        if (onFocusRelease != null) {
          onFocusRelease();
        }
        onRelease!();
      },
      onTapCancel: onRelease,
    );
  }

  /// >>> 容器控件 >>>
  Container box(
      {double? width,
      double? height,
      Color? color,
      EdgeInsets? padding,
      double borderSize = 1,
      Color borderColor = Colors.black,
      double? cornerRadius}) {
    BoxDecoration decoration = BoxDecoration(
      color: color,
      borderRadius:
          cornerRadius != null ? BorderRadius.circular(cornerRadius) : null,
      border: Border.all(width: borderSize, color: borderColor),
    );
    return Container(
      child: this,
      width: width,
      height: height,
      padding: padding,
      decoration: decoration,
    );
  }

  /// >>> 尺寸控件 >>>
  SizedBox sized({Size? size, double? height, double? width}) {
    return SizedBox(
      width: width ?? size?.width ?? double.infinity,
      height: height ?? size?.height ?? double.infinity,
      child: this,
    );
  }

  ElevatedButton button(
      {ButtonStyle? style, Color? color, required void Function()? onPressed}) {
    return ElevatedButton(
      style: style ?? ElevatedButton.styleFrom(backgroundColor: color),
      child: this,
      onPressed: onPressed,
    );
  }

  /// >>> 尺寸控件(宽度) >>>
  SizedBox widthBox(double width) {
    return SizedBox(
      width: width,
      child: this,
    );
  }

  /// >>> 尺寸控件(高度) >>>
  SizedBox heightBox(double height) {
    return SizedBox(
      height: height,
      child: this,
    );
  }

  /// >>> 旋转控件, 每次翻转90度, 顺时针 >>>
  RotatedBox rotated({required int quarter}) {
    return RotatedBox(
      quarterTurns: quarter,
      child: this,
    );
  }

  /// >>> 扩大控件 >>>
  Expanded expanded() {
    return Expanded(child: this);
  }

  /// >>> 将控件Sliver化 >>>
  Widget sliver() {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  /// >>> 半透明控件(0为透明, 1为不透明) >>>
  Opacity opacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  /// >>> 指定控件的位置, 适用于Stack >>>
  Positioned positioned(
      {double? left,
      double? right,
      double? top,
      double? bottom,
      double? width,
      double? height,
      double? all,
      double? horizon,
      double? vertical}) {
    if (all != null) {
      return Positioned(
        child: this,
        left: all,
        right: all,
        top: all,
        bottom: all,
      );
    }
    double? _left = horizon ?? left;
    double? _right = horizon ?? right;
    double? _top = horizon ?? top;
    double? _bottom = horizon ?? bottom;
    return Positioned(
      child: this,
      left: _left,
      right: _right,
      top: _top,
      bottom: _bottom,
      width: width,
      height: height,
    );
  }

  ///
  // Positioned positionRelate(
  //     {double? left,
  //     double? right,
  //     double? top,
  //     double? bottom,
  //     double? width,
  //     double? height,
  //     double? all,
  //     double? horizon,
  //     double? vertical}) {
  //   double? mLeft = all ?? horizon ?? left;
  //   double? mRight = all ?? horizon ?? right;
  //   double? mTop = all ?? horizon ?? top;
  //   double? mBottom = all ?? horizon ?? bottom;

  //   double _left = mLeft ?? 0;
  //   double _right = mRight ?? 0;
  //   double _top = mTop ?? 0;
  //   double _bottom = mBottom ?? 0;

  //   double _width = width ?? (1 - _left - _right);
  //   double _height = height ?? (1 - _top - _bottom);

  //   if (mLeft == null) {
  //     if (mRight != null && width != null) {
  //       _left = 1 - width - mRight;
  //     }
  //   }

  //   if (mRight == null) {
  //     if (mLeft != null && width != null) {
  //       _right = 1 - width - mLeft;
  //     }
  //   }

  //   if (mTop == null) {
  //     if (mBottom != null && height != null) {
  //       _top = 1 - height - mBottom;
  //     }
  //   }

  //   if (mBottom == null) {
  //     if (mTop != null && height != null) {
  //       _bottom = 1 - height - mTop;
  //     }
  //   }

  //   print('_left:$_left, _top:$_top, _width:$_width, _heght:$_height');

  //   RelativeRect r = RelativeRect.fromRect(
  //     Rect.fromLTWH(_left * 100, _top * 100, _width * 100, _height * 100),
  //     Rect.fromLTWH(0, 0, 100, 100),
  //   );
  //   print('rrrr :$r');
  //   return Positioned.fromRelativeRect(rect: r, child: this);
  // }

  /// >>> 宽高比(1为正方形) >>>
  AspectRatio aspect(double whRate) {
    return AspectRatio(aspectRatio: whRate, child: this);
  }

  /// >>> 居中控件 >>>
  Center get center {
    return Center(child: this);
  }

  /// >>> 居左 >>>
  Align get left {
    return Align(
      alignment: Alignment(-1, 0),
      child: this,
    );
  }

  /// >>> 居右 >>>
  Align get right {
    return Align(
      alignment: Alignment(1, 0),
      child: this,
    );
  }

  /// >>> 居上 >>>
  Align get top {
    return Align(
      alignment: Alignment(0, -1),
      child: this,
    );
  }

  /// >>> 居下 >>>
  Align get bottom {
    return Align(
      alignment: Alignment(0, 1),
      child: this,
    );
  }

  /// >>> 左上 >>>
  Align get leftTop {
    return Align(
      alignment: Alignment(-1, -1),
      child: this,
    );
  }

  /// >>> 右上 >>>
  Align get rightTop {
    return Align(
      alignment: Alignment(1, -1),
      child: this,
    );
  }

  /// >>> 左下 >>>
  Align get leftBottom {
    return Align(
      alignment: Alignment(-1, 1),
      child: this,
    );
  }

  /// >>> 右下 >>>
  Align get rightBottom {
    return Align(
      alignment: Alignment(1, 1),
      child: this,
    );
  }

  /// >>> 按比例配置位置(0为左或上, 1为右或下) >>>
  Align offset({required double x, required double y}) {
    double fx = x * 2 - 1;
    double fy = y * 2 - 1;
    return Align(
      alignment: Alignment(fx, fy),
      child: this,
    );
  }

  /// >>> 行为监控 >>>
  NotificationListener<T> onListen<T extends Notification>(
      NotificationListenerCallback<T> onNotification,
      {Key? key}) {
    return NotificationListener<T>(
      key: key,
      child: this,
      onNotification: onNotification,
    );
  }

  /// >>> 溢出控件 >>>
  OverflowBox overflow(
      {Key? key,
      AlignmentGeometry alignment = Alignment.topLeft,
      double? minWidth,
      double? maxWidth,
      double? minHeight,
      double? maxHeight}) {
    return OverflowBox(
      child: this,
      alignment: alignment,
      minWidth: minWidth,
      minHeight: minHeight,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }

  Widget intrinsic(IntrinsicDirection direction) {
    switch (direction) {
      case IntrinsicDirection.horizon:
        return IntrinsicWidth(child: this);
      case IntrinsicDirection.vertical:
        return IntrinsicHeight(child: this);
      case IntrinsicDirection.both:
        return IntrinsicHeight(child: IntrinsicWidth(child: this));
    }
  }

  /// >>> 限定尺寸 >>>
  ConstrainedBox constrain(
      {double? minWidth,
      double? maxWidth,
      double? minHeight,
      double? maxHeight}) {
    return ConstrainedBox(
      child: this,
      constraints: BoxConstraints(
          minWidth: minWidth ?? 0,
          minHeight: minHeight ?? 0,
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity),
    );
  }

  /// >>> 转换 >>>
  Transform rotate(
      {Key? key,
      required double degree,
      Offset? origin,
      AlignmentGeometry? alignment,
      bool transformHitTests = true,
      Widget? child}) {
    return Transform.rotate(
        angle: math.pi / degree,
        key: key,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        child: this);
  }

  /// >>> 缩放 >>>
  Transform scale(
      {Key? key,
      required double scale,
      Offset? origin,
      AlignmentGeometry? alignment,
      bool transformHitTests = true}) {
    return Transform.scale(
        scale: scale,
        key: key,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        child: this);
  }

  /// >>> 移动 >>>
  Transform move(
      {Key? key, required Offset offset, bool transformHitTests = true}) {
    return Transform.translate(
      offset: offset,
      key: key,
      transformHitTests: transformHitTests,
    );
  }

  /// >>> 隐藏 >>>
  Offstage hide({Key? key, required bool hide}) {
    return Offstage(
      child: this,
      key: key,
      offstage: hide,
    );
  }

  /// >>> 设置内容限定模式 >>>
  FittedBox fit(
      {Key? key,
      required BoxFit fit,
      AlignmentGeometry alignment = Alignment.topLeft,
      Clip clipBehavior = Clip.none}) {
    return FittedBox(
      key: key,
      fit: fit,
      alignment: alignment,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// >>> 卡片 >>>
  Card card(
      {Key? key,
      Color color = Colors.white,
      Color shadowColor = Colors.black,
      double elevation = 0,
      double radius = 4,
      bool borderOnForeground = true,
      EdgeInsetsGeometry margin = EdgeInsets.zero,
      Clip clipBehavior = Clip.hardEdge,
      bool semanticContainer = true}) {
    return Card(
      key: key,
      color: color,
      shadowColor: shadowColor,
      elevation: elevation,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      child: this,
      semanticContainer: semanticContainer,
    );
  }
}
