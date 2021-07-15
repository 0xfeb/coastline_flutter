import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

enum IntrinsicDirection {
  horizon,
  vertical,
  both,
}

extension WidgetExtra on Widget {
  /// >>> 点击控件 >>>
  InkWell onTap(Function() onTap) {
    return InkWell(
      child: this,
      onTap: onTap,
    );
  }

  /// >>> 按下/释放控件 >>>
  Widget onPress(
      {Function()? onHold, Function()? onRelease, Function()? onFocusRelease}) {
    return GestureDetector(
      child: this,
      onTapDown: (_) => onHold!(),
      onTapUp: (_) {
        if (onFocusRelease != null) {
          onFocusRelease();
        }
        onRelease!();
      },
      onTapCancel: () => onRelease!(),
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
      width: width ?? size?.width ?? 0,
      height: height ?? size?.height ?? 0,
      child: this,
    );
  }

  /// >>> 尺寸控件(宽度) >>>
  SizedBox widthed(double width) {
    return SizedBox(
      width: width,
      child: this,
    );
  }

  /// >>> 尺寸控件(高度) >>>
  SizedBox heighted(double height) {
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

  /// >>> 宽高比(1为正方形) >>>
  AspectRatio apsect(double whRate) {
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

  NotificationListener<T> onListen<T extends Notification>(
      NotificationListenerCallback<T> onNotification,
      {Key? key}) {
    return NotificationListener<T>(
      key: key,
      child: this,
      onNotification: onNotification,
    );
  }

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

  Widget intrinsic(IntrinsicDirection direciton) {
    switch (direciton) {
      case IntrinsicDirection.horizon:
        return IntrinsicWidth(child: this);
      case IntrinsicDirection.vertical:
        return IntrinsicHeight(child: this);
      case IntrinsicDirection.both:
        return IntrinsicHeight(child: IntrinsicWidth(child: this));
    }
  }

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

  Transform move(
      {Key? key, required Offset offset, bool transformHitTests = true}) {
    return Transform.translate(
      offset: offset,
      key: key,
      transformHitTests: transformHitTests,
    );
  }

  Offstage hide({Key? key, required bool hide}) {
    return Offstage(
      child: this,
      key: key,
      offstage: hide,
    );
  }

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
}
