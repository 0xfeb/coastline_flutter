import 'package:flutter/material.dart';

import '../draw/resource.dart';

import 'widget_extra.dart';

/// 标签面板组件
///
/// 提供图标标签的选择功能，支持选中状态可视化
class TagPanel extends StatefulWidget {
  final int selected;
  final Function(int) onSelect;
  final List<IconData> icons;

  /// 创建标签面板组件
  ///
  /// @param selected 初始选中索引
  /// @param onSelect 选择回调函数
  /// @param icons 图标数据列表
  const TagPanel({
    Key? key,
    required this.selected,
    required this.onSelect,
    required this.icons,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TagPanelState();
}

/// TagPanel组件的状态类
class _TagPanelState extends State<TagPanel> {
  int _selected = 0;

  @override
  void initState() {
    super.initState();

    _selected = widget.selected;
  }

  @override

  /// 构建标签面板界面
  ///
  /// @return 返回网格布局的图标选择组件
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 9,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return widget.icons[index]
            .icon(color: Colors.white)
            .box(
                cornerRadius: 2,
                borderSize: _selected == index ? 0 : 2,
                borderColor: Colors.blue)
            .opacity(_selected == index ? 1 : 0.4)
            .onTap(() {
          setState(() => _selected = index);
          widget.onSelect(_selected);
        });
      },
      itemCount: widget.icons.length,
    );
  }
}
