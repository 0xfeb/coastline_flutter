import 'package:flutter/material.dart';
import '../structure/number_extra.dart';
import '../structure/list_extra.dart';

/// >>> 几种常用色彩 >>>
enum ColorName { red, orange, yellow, green, cyan, blue, puple, pink }

double _hueOfColor(ColorName color) {
  switch (color) {
    case ColorName.red:
      return 0;
    case ColorName.orange:
      return 30;
    case ColorName.yellow:
      return 60;
    case ColorName.green:
      return 120;
    case ColorName.cyan:
      return 180;
    case ColorName.blue:
      return 240;
    case ColorName.puple:
      return 260;
    case ColorName.pink:
      return 300;
  }

  return 0;
}

extension ColorExtra on Color {
  /// >>> 获取当前颜色的相对色 >>>
  Color get opsiteHSV {
    final hsvColor = HSVColor.fromColor(this);
    return HSVColor.fromAHSV(
      hsvColor.alpha,
      (hsvColor.hue + 180) % 360,
      hsvColor.saturation,
      hsvColor.value,
    ).toColor();
  }

  /// >>> 获取当前颜色的相对色 >>>
  Color get opsiteRGB {
    return Color.fromARGB(
        this.alpha, 0xff - this.red, 0xff - this.green, 0xff - this.blue);
  }

  /// >>> 保持明度亮度的情况下调整色彩 >>>
  Color changeHue(ColorName color, {int offset = 0}) {
    final hsvColor = HSVColor.fromColor(this);
    return HSVColor.fromAHSV(
      hsvColor.alpha,
      (_hueOfColor(color) + offset).between(min: 0, max: 360.0),
      hsvColor.saturation,
      hsvColor.value,
    ).toColor();
  }

  /// >>> 获得增加亮度的色彩 >>>
  Color bright({double offset = 0.3}) {
    final hsvColor = HSVColor.fromColor(this);
    final v = (hsvColor.value + offset).between(min: 0, max: 1.0);
    return HSVColor.fromAHSV(
      hsvColor.alpha,
      hsvColor.hue,
      hsvColor.saturation,
      v,
    ).toColor();
  }

  /// >>> 获得减少亮度的色彩 >>>
  Color dark({double offset = 0.3}) {
    return bright(offset: -offset);
  }

  /// >>> 分割色彩 >>>
  List<Color> devidedColors(int number) {
    double c = 360 / number.toDouble();
    HSVColor hc = HSVColor.fromColor(this);
    double alpha = hc.alpha;
    double s = hc.saturation;
    double v = hc.value;
    return inc(length: number).map((e) {
      return HSVColor.fromAHSV(alpha, e * c, s, v).toColor();
    }).toList();
  }
}
