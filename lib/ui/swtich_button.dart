import 'package:flutter/material.dart';

import 'widget_extra.dart';

/// 可切换按钮组件
///
/// 提供在多个子组件间循环切换的功能
class SwitchButton extends StatefulWidget {
  final List<Widget> displayList;
  final int index;
  final Function(int index) onSwitch;

  /// 创建可切换按钮
  ///
  /// @param displayList 需要切换显示的组件列表
  /// @param index 初始显示索引（默认0）
  /// @param onSwitch 切换回调函数
  SwitchButton(
      {required this.displayList, this.index = 0, required this.onSwitch});

  @override
  State<StatefulWidget> createState() {
    return _SwitchButtonState();
  }
}

/// SwitchButton组件的状态类
class _SwitchButtonState extends State<SwitchButton> {
  int _index = -1;

  @override
  void initState() {
    super.initState();

    _index = widget.index;
  }

  @override

  /// 构建切换按钮界面
  ///
  /// @return 返回当前显示的组件并添加点击切换功能
  Widget build(BuildContext context) {
    Widget widget = this.widget.displayList[_index];
    return widget.onTap(() {
      int index = _index + 1;
      if (index >= this.widget.displayList.length) {
        index = 0;
      }
      setState(() {
        _index = index;
      });
      this.widget.onSwitch(_index);
    });
  }
}
