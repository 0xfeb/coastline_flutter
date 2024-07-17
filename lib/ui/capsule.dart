import 'package:flutter/material.dart';

import 'multi_widget.dart';

class Capsule extends StatelessWidget {
  final Widget left;
  final Widget right;
  final Color leftColor;
  final Color rightColor;

  const Capsule(
      {Key? key,
      required this.left,
      required this.right,
      this.leftColor = Colors.black,
      this.rightColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _borderColor;
    var _leftColor = HSVColor.fromColor(leftColor);
    var _rightColor = HSVColor.fromColor(rightColor);
    if (_leftColor.value < _rightColor.value) {
      _borderColor = leftColor;
    } else {
      _borderColor = rightColor;
    }
    return Container(
      decoration: BoxDecoration(
          color: _borderColor,
          border: Border.all(color: _borderColor),
          borderRadius: BorderRadius.circular(4)),
      child: [
        Container(
          child: left,
          padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
          decoration: BoxDecoration(
              color: leftColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              )),
        ),
        Container(
          child: right,
          padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
          decoration: BoxDecoration(
              color: rightColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3),
                bottomRight: Radius.circular(3),
              )),
        ),
      ].row(mainAxisSize: MainAxisSize.min),
    );
  }
}
