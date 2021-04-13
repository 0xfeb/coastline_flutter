import 'package:flutter/cupertino.dart';

/// >>> 绘图板控件 >>>
class CanvasView extends StatelessWidget {
  final Paint paint;
  final Size size;
  final Widget child;
  final Function(Canvas canvas, Size size) onPaint;

  const CanvasView({
    Key key,
    this.paint,
    this.size,
    @required this.onPaint,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: child,
      size: size,
      painter: _CanvasViewPainter((Canvas canvas, Size size) {
        onPaint(canvas, size);
      }),
    );
  }
}

class _CanvasViewPainter extends CustomPainter {
  final Function(Canvas canvas, Size size) runPaint;

  _CanvasViewPainter(this.runPaint);

  @override
  void paint(Canvas canvas, Size size) {
    runPaint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
