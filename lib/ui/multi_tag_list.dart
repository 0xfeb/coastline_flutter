import 'package:flutter/material.dart';
import '../structure/list_extra.dart';

/// >>> 多选Tag列表, 支持自动换行 >>>
/// 多选标签列表控件，支持自动换行布局
///
/// 通过[Wrap]布局实现标签的自动换行排列，使用[Chip]组件构建带选中状态的标签项
/// 提供多选功能并通过回调返回选中索引列表
class MultiTagList extends StatelessWidget {
  /// 标签文本列表
  final List<String>? texts;
  /// 当前选中的标签索引列表
  final List<int> selectedTags;
  /// 标签文字大小
  final double fontSize;
  /// 选中状态变化回调
  ///
  /// 参数为更新后的选中索引列表
  final Function(List<int>) onSelectTags;
  /// 选中标签的背景颜色
  final Color selectedColor;
  /// 未选中标签的背景颜色
  final Color unselectedColor;
  /// 标签文字颜色
  final Color textColor;
  /// 创建多选标签列表
  ///
  /// @param texts 标签文本列表（必须非空）
  /// @param selectedTags 初始选中的标签索引列表（默认空列表）
  /// @param fontSize 标签文字大小（默认16）
  /// @param onSelectTags 选中状态变化回调（必须非空）
  /// @param selectedColor 选中状态背景色（默认Colors.blue）
  /// @param unselectedColor 未选中状态背景色（默认Colors.grey）
  /// @param textColor 文字颜色（默认Colors.white）
  const MultiTagList(
      {Key? key,
      this.texts,
      this.selectedTags = const [],
      this.fontSize = 16,
      required this.onSelectTags,
      this.selectedColor = Colors.blue,
      this.unselectedColor = Colors.grey,
      this.textColor = Colors.white})
      : super(key: key);
  /// 构建自动换行布局
  ///
  /// 使用[Wrap]布局实现标签的自动排列，每个标签项由[Chip]组件构成
  /// 通过[InkWell]添加点击交互，切换选中状态时更新并返回新的索引列表
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: texts!.indicate.map((e) {
        return InkWell(
          child: Chip(
            label: Text(e.value),
            labelStyle: TextStyle(color: textColor, fontSize: fontSize),
            backgroundColor:
                selectedTags.contains(e.key) ? selectedColor : unselectedColor,
          ),
          onTap: () {
            List<int> tags = selectedTags;
            if (tags.contains(e.key)) {
              tags.remove(e.key);
            } else {
              tags.add(e.key);
            }
            onSelectTags(tags);
          },
        );
      }).toList(),
    );
  }
}
