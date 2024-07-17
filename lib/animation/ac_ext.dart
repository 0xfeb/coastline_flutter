import 'package:flutter/widgets.dart';

// 动画控制器的扩展
extension ACExt on AnimationController {
  Animation<V> animation<V>(V startValue, V endValue, Curve curve,
      {Curve? reverseCurve}) {
    final Animation<double> curveAnm =
        CurvedAnimation(parent: this, curve: curve, reverseCurve: reverseCurve);
    return Tween<V>(begin: startValue, end: endValue).animate(curveAnm);
  }
}

// 需要主类提供with SingleTickerProviderStateMinin
class CLAnimationController {
  final AnimationController _animationController;

  CLAnimationController(
      {required TickerProvider vsync,
      Duration duration = const Duration(milliseconds: 300)})
      : _animationController =
            AnimationController(vsync: vsync, duration: duration);

  dispose() {
    _animationController.dispose();
  }

  Widget builder<T>(
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
