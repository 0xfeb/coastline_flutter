import 'package:flutter/material.dart';

import 'package:coastline/ui/pad.dart';

import '../draw/color_extra.dart';
import '../ui/widget_extra.dart';

extension IconDataExtra on IconData {
  /// >>> 图标 >>>
  Icon icon({required Color? color, double size = 20}) {
    return Icon(
      this,
      color: color,
      size: size,
    );
  }

  /// >>> 图标白色 >>>
  Icon iconWhite({double size = 20}) {
    return icon(size: size, color: Colors.white);
  }

  /// >>> 图标黑色 >>>
  Icon iconBlack({double size = 20}) {
    return icon(size: size, color: Colors.black);
  }

  /// >>> 图标灰色 >>>
  Icon iconGray({double size = 20}) {
    return icon(size: size, color: Colors.grey);
  }

  /// >>> 图标深灰色 >>>
  Icon iconDarkGray({double size = 20}) {
    return icon(size: size, color: Colors.grey[800]);
  }

  Widget box(
      {double iconSize = 20, double radius = 0, Color color = Colors.blue}) {
    Icon icon = this.iconWhite(
      size: iconSize,
    );
    return icon.box(cornerRadius: radius, color: color).aspect(1);
  }

  Widget boardBox(
      {double iconSize = 20,
      double radius = 0,
      double boardWidth = 2,
      Color color = Colors.blue}) {
    return this
        .iconWhite(
          size: iconSize,
        )
        .box(cornerRadius: radius, color: color)
        .pad(all: boardWidth)
        .box(cornerRadius: radius, color: color.oppositeHSV)
        .aspect(1);
  }
}

extension ImageProviderExtra on ImageProvider {
  /// >>> 图形, 宽高比等比例填充 >>>
  Image get image {
    return Image(image: this, fit: BoxFit.cover);
  }

  /// >>> 图形, 宽高比失衡填充  >>>
  Image get imageFill {
    return Image(image: this, fit: BoxFit.fill);
  }
}
