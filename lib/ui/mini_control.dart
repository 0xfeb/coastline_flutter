import 'package:flutter/material.dart';

/// >>> 空隙元素 >>>
class Gap extends StatelessWidget {
  final double size;

  Gap(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
