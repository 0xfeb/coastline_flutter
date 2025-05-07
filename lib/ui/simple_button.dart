import 'package:flutter/material.dart';

import 'text_display.dart';
import 'widget_extra.dart';

/// 为字符串添加便捷按钮创建方法
///
/// 示例：
/// ```dart
/// '提交'.cbutton(color: Colors.green)
/// ```
extension SimpleButton on String {
  /// 创建带颜色的圆角按钮
  ///
  /// @param color 按钮背景颜色（默认蓝色）
  /// @return 返回配置好的ElevatedButton样式组件
  Widget cbutton({Color color = Colors.blue}) {
    return this
        .text(style: TextStyle(color: Colors.white, fontSize: 20))
        .center
        .box(cornerRadius: 4, color: color, height: 45);
  }
}
