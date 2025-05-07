import 'package:flutter/material.dart';

/// >>> 绘图板控件 >>>
/// 自定义绘图板控件
///
/// 提供尺寸可定制的绘图区域，通过[onPaint]回调实现自定义绘制逻辑
class DrawView extends StatelessWidget {
  /// 控件尺寸
  final Size size;

  /// 子控件（可选）
  final Widget? child;

  /// 绘图回调函数
  ///
  /// {@template draw_view.onPaint}
  /// 接收Canvas和Size参数，开发者在此实现具体绘制逻辑
  /// 当需要重绘时会自动调用此回调
  /// {@endtemplate}
  final Function(Canvas canvas, Size size) onPaint;

  /// 创建绘图板控件
  ///
  /// @param size 绘图区域尺寸（必须）
  /// @param onPaint 绘图回调函数（必须）
  /// @param child 子控件（可选）
  const DrawView({
    Key? key,
    required this.size,
    required this.onPaint,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: child,
      size: size,
      painter: _DrawViewPainter((Canvas canvas, Size size) {
        onPaint(canvas, size);
      }),
    );
  }
}

/// 自定义绘制器实现类
///
/// 封装实际绘制逻辑，将绘制操作委托给[runPaint]回调
class _DrawViewPainter extends CustomPainter {
  /// 实际执行绘制操作的回调
  final Function(Canvas canvas, Size size) runPaint;

  _DrawViewPainter(this.runPaint);

  @override
  void paint(Canvas canvas, Size size) {
    runPaint(canvas, size);
  }

  @override

  /// 是否需要重绘
  ///
  /// 始终返回false表示不需要重绘，由外部控制刷新
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
