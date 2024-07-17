import 'package:flutter/material.dart';

import 'package:coastline/structure/list_extra.dart';
import 'package:coastline/ui/multi_widget.dart';

import 'mini_control.dart';
import 'widget_extra.dart';

class ColorTab extends StatefulWidget {
  final int index;
  final Function(int index) onChangeTab;
  final double gapWidth;
  final List<(Color, String)> tabList;
  final Color textColor;
  final double fontSize;

  ColorTab(this.tabList,
      {Key? key,
      this.index = 0,
      required this.onChangeTab,
      this.gapWidth = 4,
      this.textColor = Colors.white,
      this.fontSize = 16})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ColorTabState();
}

class _ColorTabState extends State<ColorTab> {
  int _selected = 0;

  @override
  void initState() {
    super.initState();
    _selected = widget.index;
  }

  BorderRadius _radius(int current) {
    Radius leftRadius = Radius.zero;
    Radius rightRadius = Radius.zero;
    if (current == 0) {
      leftRadius = Radius.circular(100);
    }
    if (current == widget.tabList.length - 1) {
      rightRadius = Radius.circular(100);
    }
    return BorderRadius.horizontal(left: leftRadius, right: rightRadius);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    for (int i = 0; i < widget.tabList.length; ++i) {
      (Color, String) tab = widget.tabList[i];
      list.add(
        Container(
          decoration: BoxDecoration(
              borderRadius: _radius(i),
              color: _selected == i ? tab.$1 : tab.$1.withAlpha(80)),
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(tab.$2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: widget.textColor, fontSize: widget.fontSize))
              .center,
        ).onTap(() {
          if (_selected != i) {
            setState(() => _selected = i);
            widget.onChangeTab(_selected);
          }
        }),
      );
    }

    return list
        .mixItem(Gap(widget.gapWidth))
        .row(mainAxisAlignment: MainAxisAlignment.center);
  }
}
