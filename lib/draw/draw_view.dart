import 'package:flutter/material.dart';

/// >>> 绘图板控件 >>>
class DrawView extends StatelessWidget {
  final Size size;
  final Widget? child;
  final Function(Canvas canvas, Size size) onPaint;

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

class _DrawViewPainter extends CustomPainter {
  final Function(Canvas canvas, Size size) runPaint;

  _DrawViewPainter(this.runPaint);

  @override
  void paint(Canvas canvas, Size size) {
    runPaint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
