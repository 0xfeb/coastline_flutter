import 'package:flutter/widgets.dart';

/// 控件变形扩展(不会影响布局计算)
///
/// 提供各种矩阵变换的快捷实现方式，适用于需要临时调整控件位置/角度/尺寸的场景
extension TransformExt on Widget {
  /// 平移控件位置
  ///
  /// @param x 水平偏移量(正数向右)
  /// @param y 垂直偏移量(正数向下)
  /// @return 应用了平移变换的Widget
  Widget move({double x = 0, double y = 0}) {
    return Transform.translate(
      offset: Offset(x, y),
      child: this,
    );
  }

  /// 缩放控件尺寸
  ///
  /// @param x 水平缩放比例(1.0为原始尺寸)
  /// @param y 垂直缩放比例(1.0为原始尺寸)
  /// @param basePoint 缩放基准点，默认为中心
  /// @return 应用了缩放变换的Widget
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
  /// @param angle 旋转角度(弧度制)
  /// @param basePoint 旋转中心点，默认为控件中心
  /// @return 应用了旋转变换的Widget
  Widget rotate({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform.rotate(
      angle: angle,
      child: this,
    );
  }

  /// 镜像翻转控件
  ///
  /// @param horizontal 水平翻转
  /// @param vertical 垂直翻转
  /// @return 应用了镜像翻转的Widget
  Widget flip({bool horizontal = false, bool vertical = false}) {
    return Transform.flip(
      flipX: horizontal,
      flipY: vertical,
      child: this,
    );
  }

  /// 斜切变形
  ///
  /// @param horizontal 水平斜切强度
  /// @param vertical 垂直斜切强度
  /// @param basePoint 变形基准点
  /// @return 应用了斜切变换的Widget
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

  /// 三维X轴旋转
  ///
  /// @param angle 旋转角度(弧度制)
  /// @param basePoint 旋转轴心点
  /// @return 应用了三维旋转的Widget
  Widget rotateX({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform(
      transform: Matrix4.identity()..rotateX(angle),
      alignment: basePoint,
      child: this,
    );
  }

  /// 三维Y轴旋转
  ///
  /// @param angle 旋转角度(弧度制)
  /// @param basePoint 旋转轴心点
  /// @return 应用了三维旋转的Widget
  Widget rotateY({double angle = 0, Alignment basePoint = Alignment.center}) {
    return Transform(
      transform: Matrix4.identity()..rotateY(angle),
      alignment: basePoint,
      child: this,
    );
  }
}
