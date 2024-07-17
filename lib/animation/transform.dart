import 'package:flutter/widgets.dart';

// 控件变形, 不影响布局
extension TransformExt on Widget {
  // 移动控件
  Widget move({double x = 0, double y = 0}) {
    return Transform.translate(
      offset: Offset(x, y),
      child: this,
    );
  }

  // 拉伸控件
  Widget scale(
      {double x = 1, double y = 1, Alignment basePoint = Alignment.center}) {
    return Transform.scale(
      scaleX: x,
      scaleY: y,
      alignment: basePoint,
      child: this,
    );
  }

  // 转动控件
  Widget rotate({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform.rotate(
      angle: angle,
      child: this,
    );
  }

  // 更换位置
  Widget flip({bool horizontal = false, bool vertical = false}) {
    return Transform.flip(
      flipX: horizontal,
      flipY: vertical,
      child: this,
    );
  }

  // 扭动
  Widget skew(
      {double horizontal = 0,
      double vertical = 0,
      Alignment basePoint = Alignment.center}) {
    return Transform(
      transform: Matrix4.skew(horizontal, vertical),
      alignment: basePoint,
      child: this,
    );
  }

  // 沿着x轴转动, 一边固定, 一边放大或缩小
  Widget rotateX({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform(
      transform: Matrix4.identity()..rotateX(angle),
      alignment: basePoint,
      child: this,
    );
  }

  // 沿着y轴转动, 一边固定, 一边放大或缩小
  Widget rotateY({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform(
      transform: Matrix4.identity()..rotateY(angle),
      alignment: basePoint,
      child: this,
    );
  }
}
