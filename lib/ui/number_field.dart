import 'package:flutter/material.dart';

import 'widget_extra.dart';

/// >>> 数字输入框 >>>
class NumberField extends StatelessWidget {
  final Color color;
  final int min;
  final int max;
  final TextEditingController? controller;
  final FocusNode? focus;
  final TextStyle style;

  const NumberField(
      {Key? key,
      this.color = Colors.blue,
      this.min = 0,
      this.max = 10000,
      this.controller,
      this.focus,
      this.style = const TextStyle(fontSize: 30)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: controller,
      focusNode: focus,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.numberWithOptions(),
      style: style,
      decoration: InputDecoration(
        prefixIcon: AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ).onTap(() {
            int number = min;
            bool? textNotEmpty = controller?.text.isNotEmpty;
            if (textNotEmpty == true) {
              number = int.parse(controller!.text) - 1;
              if (number < min) {
                number = min;
              }
            }
            if (controller != null) {
              controller!.text = '$number';
              controller!.selection =
                  TextSelection(baseOffset: 0, extentOffset: 0);
            }
          }),
        ),
        suffixIcon: AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ).onTap(() {
            int number = max;
            bool? textNotEmpty = controller?.text.isNotEmpty;
            if (textNotEmpty == true) {
              number = int.parse(controller!.text) + 1;
              if (number > max) {
                number = max;
              }
            }
            if (controller != null) {
              controller!.text = '$number';
              controller!.selection =
                  TextSelection(baseOffset: 0, extentOffset: 0);
            }
          }),
        ),
      ),
    );
  }
}
