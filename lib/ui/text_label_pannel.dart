import 'package:flutter/material.dart';

import 'text_display.dart';
import 'widget_extra.dart';

class TextLabelPannel extends StatefulWidget {
  final List<String> textList;
  final String preforText;
  final Function(String) onSelectLabel;
  final double fontSize;

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

class _TextLabelPannelState extends State<TextLabelPannel> {
  @override
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
