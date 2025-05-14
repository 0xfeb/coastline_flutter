import 'package:flutter/widgets.dart';

// 动画控制器的扩展
extension ACExt on AnimationController {
  /// 创建一个动画对象
  ///
  /// [startValue] 动画开始值
  /// [endValue] 动画结束值
  /// [curve] 动画曲线
  /// [reverseCurve] 反向动画曲线
  ///
  /// 返回一个动画对象
  ///
  /// * 使用方法
  /// ```dart
  /// _animationController = AnimationController(vsync: this); // 创建动画控制器, 绑定到with SingleTickerProviderStateMixin的State
  /// _animation = _animationController.animation(0, 100, Curves.easeInOut); // 创建动画对象
  /// ...
  /// AnimatedBuilder(
  ///  animation: _animation,
  ///  builder: (context, child) {
  ///    return Container(
  ///      width: _animation.value,
  ///      height: _animation.value,
  ///      color: Colors.red,
  ///      child: Text('hello world'),
  ///    );
  ///  },
  /// ); // 创建动画组件
  /// ...
  /// _animationController.forward(); // 播放动画
  /// ...
  /// _animationController.dispose(); // 释放动画控制器
  /// ```
  Animation<V> animation<V>(V startValue, V endValue, Curve curve,
      {Curve? reverseCurve}) {
    final Animation<double> curveAnm =
        CurvedAnimation(parent: this, curve: curve, reverseCurve: reverseCurve);
    return Tween<V>(begin: startValue, end: endValue).animate(curveAnm);
  }
}

/// 封装的动画控制器
/// 需要主类提供with SingleTickerProviderStateMixin
/// * 使用方法
/// ```dart
/// _animationController = CLAnimationController(vsync: this); // 创建动画控制器
/// ...
/// _animationController.builder(
///   startValue: 0,
///   endValue: 100,
///   child: Text('hello world'),
///   builder: (context, child) {
///     return Container(
///       width: animation.value,
///       height: animation.value,
///       color: Colors.red,
///       child: child,
///     );
///   },
/// ); // 创建动画组件
/// ...
/// _animationController.forward(); // 播放动画
/// ...
/// _animationController.dispose(); // 释放动画控制器
/// ```
class CLAnimationController {
  final AnimationController _animationController;

  /// 创建一个CLAnimationController实例
  ///
  /// [vsync] 提供ticker的类
  /// [duration] 动画持续时间，默认300毫秒
  CLAnimationController(
      {required TickerProvider vsync,
      Duration duration = const Duration(milliseconds: 300)})
      : _animationController =
            AnimationController(vsync: vsync, duration: duration);

  /// 释放资源
  dispose() {
    _animationController.dispose();
  }

  /// 构建动画Widget
  ///
  /// [startValue] 动画开始值
  /// [endValue] 动画结束值
  /// [builder] 构建动画的回调函数
  /// [child] 子Widget
  ///
  /// 返回一个AnimatedBuilder对象
  Widget build<T>(
      {required T startValue,
      required T endValue,
      required TransitionBuilder builder,
      Widget? child}) {
    Animation animation =
        Tween(begin: startValue, end: endValue).animate(_animationController);
    return AnimatedBuilder(
        animation: animation, builder: builder, child: child);
  }
}
