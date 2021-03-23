import 'package:flutter/material.dart';

extension WidgetPadded on Widget {
  /// >>> 配置尺寸适配 >>>
  Padding pad(
      {double left = 0,
      double right = 0,
      double top = 0,
      double bottom = 0,
      double vertical,
      double all,
      double horizon}) {
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

extension SliverPadded on SliverWithKeepAliveWidget {
  /// >>> 配置尺寸适配 >>>
  SliverPadding pad(
      {double left = 0,
      double right = 0,
      double top = 0,
      double bottom = 0,
      double vertical,
      double all,
      double horizon}) {
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
