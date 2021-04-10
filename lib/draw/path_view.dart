import 'package:flutter/cupertino.dart';

/// >>> 绘图组件 >>>
class PathView extends StatelessWidget {
  final Path path;
  final Paint paint;
  final Size size;
  final Widget child;

  const PathView({Key key, this.path, this.paint, this.size, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: child,
      size: size,
      painter: _PathViewPainter((Canvas canvas, Size size) {
        canvas.drawPath(path, paint);
      }),
    );
  }
}

class _PathViewPainter extends CustomPainter {
  final Function(Canvas canvas, Size size) runPaint;

  _PathViewPainter(this.runPaint);

  @override
  void paint(Canvas canvas, Size size) {
    runPaint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
