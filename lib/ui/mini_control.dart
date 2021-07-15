import 'package:flutter/material.dart';

/// >>> 空隙元素 >>>
class Gap extends StatelessWidget {
  final double height;
  final double width;

  Gap({this.height = 0, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
