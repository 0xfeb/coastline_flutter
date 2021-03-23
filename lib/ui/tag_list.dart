import 'package:flutter/material.dart';
import '../structure/list_extra.dart';

/// >>> Tag列表, 支持自动换行 >>>
class TagList extends StatelessWidget {
  final List<String> texts;
  final int selectedTag;
  final double fontSize;
  final Function(int) onSelectTag;
  final Color selectedColor;
  final Color unselectedColor;
  final Color textColor;

  const TagList(
      {Key key,
      this.texts,
      this.selectedTag = 0,
      this.fontSize = 16,
      this.onSelectTag,
      this.selectedColor = Colors.blue,
      this.unselectedColor = Colors.grey,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: texts.indicate.map((e) {
        return InkWell(
          child: Chip(
            label: Text(e.a),
            labelStyle: TextStyle(color: textColor, fontSize: fontSize),
            backgroundColor:
                selectedTag == e.b ? selectedColor : unselectedColor,
          ),
          onTap: onSelectTag(e.b),
        );
      }).toList(),
    );
  }
}
