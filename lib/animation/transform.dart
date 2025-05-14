import 'dart:math';

import 'package:flutter/widgets.dart';

/// 控件变形扩展(不会影响布局计算)
///
/// 提供各种矩阵变换的快捷实现方式，适用于需要临时调整控件位置/角度/尺寸的场景
extension TransformExt on Widget {
  /// 平移控件位置
  ///
  /// [ x] 水平偏移量(正数向右)
  /// [y] 垂直偏移量(正数向下)
  ///
  /// 返回应用了平移变换的Widget
  Widget move({double x = 0, double y = 0}) {
    return Transform.translate(
      offset: Offset(x, y),
      child: this,
    );
  }

  /// 缩放控件尺寸
  ///
  /// [ x] 水平缩放比例(1.0为原始尺寸)
  /// [y] 垂直缩放比例(1.0为原始尺寸)
  /// [basePoint] 缩放基准点，默认为中心
  /// 返回应用了缩放变换的Widget
  Widget scale(
      {double x = 1, double y = 1, Alignment basePoint = Alignment.center}) {
    return Transform.scale(
      scaleX: x,
      scaleY: y,
      alignment: basePoint,
      child: this,
    );
  }

  /// 二维平面旋转
  ///
  /// [angle] 旋转角度, 使用角度, 顺时针方向
  /// [basePoint] 旋转中心点，默认为控件中心
  /// 返回应用了旋转变换的Widget
  Widget rotate({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: this,
    );
  }

  /// 镜像翻转控件
  ///
  /// [horizontal] 水平翻转
  /// [vertical] 垂直翻转
  /// 返回应用了镜像翻转的Widget
  Widget flip({bool horizontal = false, bool vertical = false}) {
    return Transform.flip(
      flipX: horizontal,
      flipY: vertical,
      child: this,
    );
  }

  /// 斜切变形
  ///
  /// [horizontal] 水平斜切强度, 使用角度, 比如上边向左移动, 下边向右移动, 形成45度角, 则值为45
  /// [vertical] 垂直斜切强度, 使用角度, 比如左边向上移动, 右边向下移动, 形成45度角, 则值为45
  /// [basePoint] 变形基准点
  /// 返回应用了斜切变换的Widget
  Widget skew(
      {double horizontal = 0,
      double vertical = 0,
      Alignment basePoint = Alignment.center}) {
    return Transform(
      transform:
          Matrix4.skew(tan(horizontal * pi / 180), tan(vertical * pi / 180)),
      alignment: basePoint,
      child: this,
    );
  }

  /// 三维X轴旋转
  ///
  /// [angle] 旋转角度, 使用角度
  /// [basePoint] 旋转轴心点
  /// 返回应用了三维旋转的Widget
  Widget rotateX({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform(
      transform: Matrix4.identity()..rotateX(angle * pi / 180),
      alignment: basePoint,
      child: this,
    );
  }

  /// 三维Y轴旋转
  ///
  /// [angle] 旋转角度, 使用角度
  /// [basePoint] 旋转轴心点
  /// 返回应用了三维旋转的Widget
  Widget rotateY({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform(
      transform: Matrix4.identity()..rotateY(angle * pi / 180),
      alignment: basePoint,
      child: this,
    );
  }
}
