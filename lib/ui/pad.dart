import 'package:flutter/material.dart';

/// 为Widget添加便捷的padding扩展方法
/// 
/// 示例：
/// ```dart
/// Container().pad(all: 10)
/// ```
extension WidgetPadded on Widget {
  /// 为Widget添加padding
  ///
  /// @param left 左间距（默认0）
  /// @param right 右间距（默认0）
  /// @param top 上间距（默认0）
  /// @param bottom 下间距（默认0）
  /// @param vertical 垂直方向间距（同时设置top和bottom）
  /// @param all 统一设置所有方向间距
  /// @param horizon 水平方向间距（同时设置left和right）
  /// @return 带padding的Padding组件
  Padding pad(
      {double left = 0,
      double right = 0,
      double top = 0,
      double bottom = 0,
      double? vertical,
      double? all,
      double? horizon}) {
    EdgeInsets insets;
    if (all != null) {
      insets = EdgeInsets.all(all);
    } else {
      double _left = horizon ?? left;
      double _right = horizon ?? right;
      double _top = vertical ?? top;
      double _bottom = vertical ?? bottom;
      insets = EdgeInsets.fromLTRB(_left, _top, _right, _bottom);
    }
    return Padding(
      padding: insets,
      child: this,
    );
  }
}

/// 为Sliver组件添加便捷的padding扩展方法
/// 
/// 示例：
/// ```dart
/// SliverList().pad(vertical: 8)
/// ```
extension SliverPadded on SliverWithKeepAliveWidget {
  /// 为Sliver组件添加padding
  ///
  /// @param left 左间距（默认0）
  /// @param right 右间距（默认0）
  /// @param top 上间距（默认0）
  /// @param bottom 下间距（默认0）
  /// @param vertical 垂直方向间距（同时设置top和bottom）
  /// @param all 统一设置所有方向间距
  /// @param horizon 水平方向间距（同时设置left和right）
  /// @return 带padding的SliverPadding组件
  SliverPadding pad(
      {double left = 0,
      double right = 0,
      double top = 0,
      double bottom = 0,
      double? vertical,
      double? all,
      double? horizon}) {
    EdgeInsets insets;
    if (all != null) {
      insets = EdgeInsets.all(all);
    } else {
      double _left = horizon ?? left;
      double _right = horizon ?? right;
      double _top = vertical ?? top;
      double _bottom = vertical ?? bottom;
      insets = EdgeInsets.fromLTRB(_left, _top, _right, _bottom);
    }
    return SliverPadding(
      padding: insets,
      sliver: this,
    );
  }
}
