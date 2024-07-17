import 'package:flutter/material.dart';

import 'text_display.dart';
import 'widget_extra.dart';

extension SimpleButton on String {
  Widget cbutton({Color color = Colors.blue}) {
    return this
        .text(style: TextStyle(color: Colors.white, fontSize: 20))
        .center
        .box(cornerRadius: 4, color: color, height: 45);
  }
}
