import 'package:flutter/material.dart';

import 'text_display.dart';
import 'widget_extra.dart';

class TextLabelPanel extends StatefulWidget {
  final List<String> textList;
  final String preferText;
  final Function(String) onSelectLabel;
  final double fontSize;

  const TextLabelPanel(
      {Key? key,
      required this.textList,
      required this.preferText,
      required this.onSelectLabel,
      this.fontSize = 14})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextLabelPanelState();
}

class _TextLabelPanelState extends State<TextLabelPanel> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tagList = widget.textList.map((tag) {
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
