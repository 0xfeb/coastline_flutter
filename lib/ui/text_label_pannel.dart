import 'package:flutter/material.dart';

import 'text_display.dart';
import 'widget_extra.dart';

/// 文本标签面板组件
///
/// 提供可交互的文本标签选择功能，支持预设选中状态
class TextLabelPannel extends StatefulWidget {
  final List<String> textList;
  final String preforText;
  final Function(String) onSelectLabel;
  final double fontSize;

  /// 创建文本标签面板组件
///
/// @param textList 可选的文本标签列表
/// @param preforText 预设选中的文本
/// @param onSelectLabel 标签选择回调函数
/// @param fontSize 标签文字大小（默认14）
const TextLabelPannel(
      {Key? key,
      required this.textList,
      required this.preforText,
      required this.onSelectLabel,
      this.fontSize = 14})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextLabelPannelState();
}

/// TextLabelPannel组件的状态类
class _TextLabelPannelState extends State<TextLabelPannel> {
  @override
  /// 构建标签面板界面
  ///
  /// @return 返回自动换行的可交互文本标签列表
  Widget build(BuildContext context) {
    List<Widget> tagList = widget.textList.map((tag) {
      // var color = tag == widget.preforText
      //     ? Theme.of(context).primaryColor
      //     : Theme.of(context).primaryColor.withAlpha(100);
      return Chip(
        labelPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        backgroundColor: Colors.grey[700],
        label: tag.text(
            style: TextStyle(fontSize: widget.fontSize, color: Colors.white)),
      ).onTap(() => widget.onSelectLabel(tag));
    }).toList();

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: tagList,
    );
  }
}
