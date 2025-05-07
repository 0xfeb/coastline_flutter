import 'package:flutter/material.dart';

/// 路径绘制视图组件
///
/// 用于通过CustomPaint展示自定义路径图形，支持子组件的叠加显示
///
/// {@template path_view}
/// [path] 需要绘制的Path对象（必须）
/// [paint] 路径的绘制样式配置（必须）
/// [child] 叠加在画布上的子组件（可选）
/// {@endtemplate}
class PathView extends StatelessWidget {
  final Path path;
  final Paint paint;
  final Widget? child;

  /// 创建路径视图
  ///
  /// @param key 组件键
  /// @param path 要绘制的路径对象
  /// @param paint 路径的绘制样式
  /// @param child 叠加在画布上的子组件
  const PathView(
      {Key? key, required this.path, required this.paint, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: child,
      //size: size,
      painter: _PathViewPainter((Canvas canvas, Size size) {
        canvas.drawPath(path, paint);
      }),
    );
  }
}

/// 路径视图绘制器（内部类）
///
/// 实现CustomPainter接口完成实际绘制逻辑
class _PathViewPainter extends CustomPainter {
  /// 绘制执行回调
  ///
  /// {@macro path_view.paint_callback}
  /// 参数包含画布对象和可用绘制区域尺寸
  final Function(Canvas canvas, Size size) runPaint;

  /// 创建路径绘制器
  ///
  /// @param runPaint 实际执行绘制操作的函数回调
  _PathViewPainter(this.runPaint);

  @override
  void paint(Canvas canvas, Size size) {
    runPaint(canvas, size);
  }

  @override

  /// 判断是否需要重绘
  ///
  /// 由于路径参数通过PathView组件树传递，此处固定返回false
  /// 实际重绘逻辑由Flutter框架自动处理
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
