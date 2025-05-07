import 'package:flutter/material.dart';
import '../structure/list_extra.dart';

/// >>> Tag列表, 支持自动换行 >>>
/// 自动换行的标签列表组件
///
/// 支持单选交互和样式定制，适用于标签选择场景
class TagList extends StatelessWidget {
  final List<String>? texts;
  final int selectedTag;
  final double fontSize;
  final Function(int) onSelectTag;
  final Color selectedColor;
  final Color unselectedColor;
  final Color textColor;

  /// 创建标签列表组件
  ///
  /// @param texts 标签文本列表
  /// @param selectedTag 当前选中的标签索引（默认0）
  /// @param fontSize 标签文字大小（默认16）
  /// @param onSelectTag 标签选择回调函数
  /// @param selectedColor 选中状态背景色（默认蓝色）
  /// @param unselectedColor 未选中状态背景色（默认灰色）
  /// @param textColor 文字颜色（默认白色）
  const TagList(
      {Key? key,
      this.texts,
      this.selectedTag = 0,
      this.fontSize = 16,
      required this.onSelectTag,
      this.selectedColor = Colors.blue,
      this.unselectedColor = Colors.grey,
      this.textColor = Colors.white})
      : super(key: key);

  @override

  /// 构建标签列表界面
  ///
  /// @return 自动换行的标签列表组件
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
                selectedTag == e.key ? selectedColor : unselectedColor,
          ),
          onTap: () {
            onSelectTag(e.key);
          },
        );
      }).toList(),
    );
  }
}
