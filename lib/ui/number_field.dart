import 'package:flutter/material.dart';
import 'widget_extra.dart';

class NumberField extends StatelessWidget {
  final Color color;
  final int min;
  final int max;
  final TextEditingController controller;
  final FocusNode focus;
  final TextStyle style;

  const NumberField(
      {Key key,
      this.color,
      this.min = 0,
      this.max = 10000,
      this.controller,
      this.focus,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focus,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.numberWithOptions(),
      style: style,
      decoration: InputDecoration(
        prefixIcon: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ).onTap(() {
            int number = min;
            if (controller != null &&
                controller.text != null &&
                controller.text.length > 0) {
              number = int.parse(controller.text) - 1;
              if (number < min) {
                number = min;
              }
            }
            controller.text = '$number';
          }),
        ),
        suffixIcon: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ).onTap(() {
            int number = max;
            if (controller != null &&
                controller.text != null &&
                controller.text.length > 0) {
              number = int.parse(controller.text) + 1;
              if (number > max) {
                number = max;
              }
            }
            controller.text = '$number';
          }),
        ),
      ),
    );
  }
}
