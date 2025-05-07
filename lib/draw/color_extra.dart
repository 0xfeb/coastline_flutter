import 'dart:math';

import 'package:flutter/material.dart';

import '../structure/list_extra.dart';
import '../structure/number_extra.dart';

/// >>> 几种常用色彩 >>>
/// 几种常用色彩枚举
///
/// 定义常用颜色的色相基准值，用于色彩处理
enum ColorName {
  /// 红色 - 色相0度
  red,

  /// 橙色 - 色相30度
  orange,

  /// 黄色 - 色相60度
  yellow,

  /// 绿色 - 色相120度
  green,

  /// 青色 - 色相180度
  cyan,

  /// 蓝色 - 色相240度
  blue,

  /// 紫色 - 色相260度
  purple,

  /// 粉色 - 色相300度
  pink
}

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
    case ColorName.purple:
      return 260;
    case ColorName.pink:
      return 300;
  }
}

/// >>> 生成随机颜色 >>>
///
/// [saturation] 饱和度，取值范围0.0-1.0（默认0.5）
/// [value] 明度，取值范围0.0-1.0（默认0.5）
/// @return 返回随机生成的HSV颜色对象
Color randomColor({double saturation = 0.5, double value = 0.5}) {
  double hue = Random().nextDouble() * 360.0;

  return HSVColor.fromAHSV(1, hue, saturation, value).toColor();
}

extension ColorExtra on Color {
  /// >>> 获取当前颜色的相对色 >>>
  ///
  /// 在HSV色轮上旋转180度得到反色，保持饱和度(saturation)
  /// 和明度(value)不变
  /// @return 新的颜色对象
  Color get oppositeHSV {
    final hsvColor = HSVColor.fromColor(this);
    return HSVColor.fromAHSV(
      hsvColor.alpha,
      (hsvColor.hue + 180) % 360,
      hsvColor.saturation,
      hsvColor.value,
    ).toColor();
  }

  /// >>> 获取当前颜色的相对色 >>>
  Color get oppositeRGB {
    return Color.from(
        alpha: a, red: 1 - this.r, green: 1 - this.g, blue: 1 - this.b);
  }

  /// >>> 获得当前颜色对应的随机色 >>>
  Color get random {
    final hsvColor = HSVColor.fromColor(this);
    double hue = Random().nextDouble() * 360.0;
    return HSVColor.fromAHSV(
            hsvColor.alpha, hue, hsvColor.saturation, hsvColor.value)
        .toColor();
  }

  /// >>> 保持明度亮度的情况下调整色彩 >>>
  Color changeHue(ColorName color, {int offset = 0}) {
    final hsvColor = HSVColor.fromColor(this);
    return HSVColor.fromAHSV(
      hsvColor.alpha,
      (_hueOfColor(color) + offset).limitBetween(0, 360.0) as double,
      hsvColor.saturation,
      hsvColor.value,
    ).toColor();
  }

  /// >>> 获得增加亮度的色彩 >>>
  Color changeColorValue({double offset = 0.3}) {
    final hsvColor = HSVColor.fromColor(this);
    final v = (hsvColor.value + offset).limitBetween(0, 1.0);
    return HSVColor.fromAHSV(
      hsvColor.alpha,
      hsvColor.hue,
      hsvColor.saturation,
      v as double,
    ).toColor();
  }

  Color toLight({double offset = 0.3}) {
    final hsvColor = HSVColor.fromColor(this);
    final s = (hsvColor.saturation + offset).limitBetween(0.0, 1.0) as double;
    return HSVColor.fromAHSV(
      hsvColor.alpha,
      hsvColor.hue,
      s,
      hsvColor.value,
    ).toColor();
  }

  /// >>> 获得减少亮度的色彩 >>>
  Color toDark({double offset = 0.3}) {
    return toLight(offset: -offset);
  }

  /// >>> 分割色彩 >>>
  List<Color> dividedColors(int number) {
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
