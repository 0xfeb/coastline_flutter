import 'package:flutter/material.dart';

/// 矩形裁剪组件
///
/// 通过传入的[clip]函数定义裁剪区域
class _ClipRect extends CustomClipper<Rect> {
  final Rect Function(Size) clip;

  _ClipRect(this.clip);

  @override
  Rect getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

/// 圆角矩形裁剪组件
///
/// 通过传入的[clip]函数定义圆角矩形裁剪区域
class _ClipRRect extends CustomClipper<RRect> {
  final RRect Function(Size) clip;

  _ClipRRect(this.clip);

  @override
  RRect getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return true;
  }
}

/// 圆形/椭圆形裁剪组件
///
/// 通过传入的[clip]函数定义圆形或椭圆形裁剪区域
class _ClipRound extends CustomClipper<Rect> {
  final Rect Function(Size) clip;

  _ClipRound(this.clip);

  @override
  Rect getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

/// 路径裁剪组件
///
/// 通过传入的[clip]函数定义任意形状的路径裁剪区域
class _ClipPath extends CustomClipper<Path> {
  final Path Function(Size) clip;

  _ClipPath(this.clip);

  @override
  Path getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

// >>> 切割组件 >>>
/// 组件裁剪扩展方法
///
/// 为任意Widget添加多种裁剪方式的扩展方法
extension ClipWidget on Widget {
    /// 自定义矩形裁剪
  ///
  /// 参数:
  /// - [key]: 组件键
  /// - [clipper]: 自定义裁剪器
  /// - [clipBehavior]: 裁剪行为，默认hardEdge
  ClipRect _clipRectCustom(
      {Key? key,
      CustomClipper<Rect>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

    /// 矩形裁剪快捷方法
  ///
  /// 参数:
  /// - [clip]: 定义裁剪区域的函数
  ///
  /// 示例:
  /// ```dart
  /// Container()
  ///   .clipRect((size) => Rect.fromLTWH(10,10,100,100))
  /// ```
  ClipRect clipRect({Rect Function(Size)? clip}) {
    return _clipRectCustom(clipper: clip == null ? null : _ClipRect(clip));
  }

    /// 自定义圆角矩形裁剪
  ///
  /// 参数:
  /// - [key]: 组件键
  /// - [borderRadius]: 圆角半径，默认5.0
  /// - [clipper]: 自定义裁剪器
  /// - [clipBehavior]: 裁剪行为，默认hardEdge
  ClipRRect _clipRRectCustom(
      {Key? key,
      double borderRadius = 5.0,
      CustomClipper<RRect>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipRRect(
      key: key,
      borderRadius: BorderRadius.circular(5.0),
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

    /// 圆角矩形裁剪快捷方法
  ///
  /// 参数:
  /// - [clip]: 定义圆角矩形区域的函数
  /// - [borderRadius]: 圆角半径，默认4
  ///
  /// 示例:
  /// ```dart
  /// Container()
  ///   .clipRRect((size) => RRect.fromRectXY(Rect.fromLTWH(0,0,100,100), 8, 8))
  /// ```
  ClipRRect clipRRect({RRect Function(Size)? clip, double borderRadius = 4}) {
    return _clipRRectCustom(
        clipper: clip == null ? null : _ClipRRect(clip),
        borderRadius: borderRadius);
  }

    /// 自定义圆形裁剪
  ///
  /// 参数:
  /// - [key]: 组件键
  /// - [clipper]: 自定义裁剪器
  /// - [clipBehavior]: 裁剪行为，默认hardEdge
  ClipOval _clipRoundCustom(
      {Key? key,
      CustomClipper<Rect>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

    /// 圆形裁剪快捷方法
  ///
  /// 参数:
  /// - [clip]: 定义裁剪区域的函数
  ///
  /// 示例:
  /// ```dart
  /// Container()
  ///   .clipRound((size) => Rect.fromCircle(center: size.center(Offset.zero), radius: 50))
  /// ```
  ClipOval clipRound({Rect Function(Size)? clip}) {
    return _clipRoundCustom(clipper: clip == null ? null : _ClipRound(clip));
  }

    /// 自定义路径裁剪
  ///
  /// 参数:
  /// - [key]: 组件键
  /// - [clipper]: 自定义路径裁剪器
  /// - [clipBehavior]: 裁剪行为，默认hardEdge
  ClipPath _clipPathCustom(
      {Key? key,
      CustomClipper<Path>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipPath(
      key: key,
      clipBehavior: clipBehavior,
      clipper: clipper,
      child: this,
    );
  }

    /// 路径裁剪快捷方法
  ///
  /// 参数:
  /// - [clip]: 定义裁剪路径的函数
  ///
  /// 示例:
  /// ```dart
  /// Container()
  ///   .clipPath((size) => Path()..addOval(Rect.fromLTWH(0,0,100,100)))
  /// ```
  ClipPath clipPath(Path Function(Size) clip) {
    return _clipPathCustom(clipper: _ClipPath(clip));
  }
}
