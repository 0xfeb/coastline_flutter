import 'package:flutter/material.dart';

extension WidgetExtra on Widget {
  InkWell onTap(Function() onTap) {
    return InkWell(
      child: this,
      onTap: onTap,
    );
  }

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

  SizedBox sized({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Container rrect(double radius) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      child: this,
    );
  }

  RotatedBox rotated({int quarter}) {
    return RotatedBox(
      quarterTurns: quarter,
      child: this,
    );
  }

  Expanded expanded() {
    return Expanded(child: this);
  }

  Widget sliver() {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  Opacity opacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

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

  AspectRatio apsect({double ratio = 1}) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }

  Center get center {
    return Center(child: this);
  }

  Align get left {
    return Align(
      alignment: Alignment(-1, 0),
      child: this,
    );
  }

  Align get right {
    return Align(
      alignment: Alignment(1, 0),
      child: this,
    );
  }

  Align get top {
    return Align(
      alignment: Alignment(0, -1),
      child: this,
    );
  }

  Align get bottom {
    return Align(
      alignment: Alignment(0, 1),
      child: this,
    );
  }

  Align get leftTop {
    return Align(
      alignment: Alignment(-1, -1),
      child: this,
    );
  }

  Align get rightTop {
    return Align(
      alignment: Alignment(1, -1),
      child: this,
    );
  }

  Align get leftBottom {
    return Align(
      alignment: Alignment(-1, 1),
      child: this,
    );
  }

  Align get rightBottom {
    return Align(
      alignment: Alignment(1, 1),
      child: this,
    );
  }

  Align align({double fx = 0, double fy = 0}) {
    return Align(
      alignment: Alignment(fx, fy),
      child: this,
    );
  }
}
