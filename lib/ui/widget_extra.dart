import 'package:flutter/material.dart';

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
      {Function() onHold, Function() onRelease, Function() onFocusRelease}) {
    return GestureDetector(
      child: this,
      onTapDown: (_) => onHold(),
      onTapUp: (_) {
        if (onFocusRelease != null) {
          onFocusRelease();
        }
        onRelease();
      },
      onTapCancel: () => onRelease(),
    );
  }

  /// >>> 容器控件 >>>
  Container box(
      {double width,
      double height,
      Color color,
      EdgeInsets padding,
      double cornerRadius}) {
    if (cornerRadius == null) {
      return Container(
        child: this,
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(color: color),
      );
    }
    return Container(
      child: this,
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(cornerRadius)),
    );
  }

  /// >>> 尺寸控件 >>>
  SizedBox sized({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  /// >>> 旋转控件, 每次翻转90度, 顺时针 >>>
  RotatedBox rotated({int quarter}) {
    return RotatedBox(
      quarterTurns: quarter,
      child: this,
    );
  }

  /// >>> 伸缩内部控件 >>>
  Container fitted(BoxFit fit,
      {Color color, double width, double height, double cornerRadius = 0.0}) {
    return Container(
      child: FittedBox(
        child: this,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius), color: color),
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
      {double left,
      double right,
      double top,
      double bottom,
      double width,
      double height,
      double all,
      double horizon,
      double vertical}) {
    if (all != null) {
      return Positioned(
        child: this,
        left: all,
        right: all,
        top: all,
        bottom: all,
      );
    }
    double _left = horizon ?? left;
    double _right = horizon ?? right;
    double _top = horizon ?? top;
    double _bottom = horizon ?? bottom;
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
  AspectRatio apsect({double ratio = 1}) {
    return AspectRatio(aspectRatio: ratio, child: this);
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
  Align align({double fx = 0, double fy = 0}) {
    return Align(
      alignment: Alignment(fx, fy),
      child: this,
    );
  }
}
