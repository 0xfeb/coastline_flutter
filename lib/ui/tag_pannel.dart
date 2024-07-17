import 'package:flutter/material.dart';

import '../draw/resource.dart';

import 'widget_extra.dart';

class TagPannel extends StatefulWidget {
  final int selected;
  final Function(int) onSelect;
  final List<IconData> icons;

  const TagPannel({
    Key? key,
    required this.selected,
    required this.onSelect,
    required this.icons,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TagPannelState();
}

class _TagPannelState extends State<TagPannel> {
  int _selected = 0;

  @override
  void initState() {
    super.initState();

    _selected = widget.selected;
  }

  @override
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
