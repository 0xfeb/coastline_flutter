import 'package:flutter/material.dart';
import '../structure/list_extra.dart';

/// >>> 多选Tag列表, 支持自动换行 >>>
class MultiTagList extends StatelessWidget {
  final List<String> texts;
  final List<int> selectedTags;
  final double fontSize;
  final Function(List<int>) onSelectTags;
  final Color selectedColor;
  final Color unselectedColor;
  final Color textColor;

  const MultiTagList(
      {Key key,
      this.texts,
      this.selectedTags = const [],
      this.fontSize = 16,
      @required this.onSelectTags,
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
