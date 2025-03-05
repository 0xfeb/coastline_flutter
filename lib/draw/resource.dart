import 'package:flutter/material.dart';

import 'package:coastline/ui/pad.dart';

import '../draw/color_extra.dart';
import '../ui/widget_extra.dart';

/// IconData扩展方法
///
/// 提供图标颜色、尺寸及容器样式的快速创建方法
extension IconDataExtra on IconData {
  /// 创建基础图标
  ///
  /// @param color 图标颜色
  /// @param size 图标尺寸（默认20）
  /// @return 返回配置好的Icon组件
  Icon icon({required Color? color, double size = 20}) {
    return Icon(
      this,
      color: color,
      size: size,
    );
  }

  /// 创建白色图标
  ///
  /// @param size 图标尺寸（默认20）
  /// @return 返回白色Icon组件
  Icon iconWhite({double size = 20}) {
    return icon(size: size, color: Colors.white);
  }

  /// 创建黑色图标
  ///
  /// @param size 图标尺寸（默认20）
  /// @return 返回黑色Icon组件
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

/// ImageProvider扩展方法
///
/// 提供图片展示样式的快捷配置
extension ImageProviderExtra on ImageProvider {
  /// 等比例填充图片
  ///
  /// @return 返回BoxFit.cover样式的Image组件
  Image get image {
    return Image(image: this, fit: BoxFit.cover);
  }

  /// 拉伸填充图片
  ///
  /// @return 返回BoxFit.fill样式的Image组件
  Image get imageFill {
    return Image(image: this, fit: BoxFit.fill);
  }
}
