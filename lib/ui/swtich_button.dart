import 'package:flutter/material.dart';

import 'widget_extra.dart';

class SwitchButton extends StatefulWidget {
  final List<Widget> displayList;
  final int index;
  final Function(int index) onSwitch;

  SwitchButton(
      {required this.displayList, this.index = 0, required this.onSwitch});

  @override
  State<StatefulWidget> createState() {
    return _SwitchButtonState();
  }
}

class _SwitchButtonState extends State<SwitchButton> {
  int _index = -1;

  @override
  void initState() {
    super.initState();

    _index = widget.index;
  }

  @override
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
