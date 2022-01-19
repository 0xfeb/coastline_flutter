import 'package:flutter/material.dart';
import 'pad.dart';

/// >>> 显示格式列表控件 >>>
class GridList extends StatelessWidget {
  final int rowNumber;
  final int selectedIndex;
  final int? count;
  final Function(int)? onSelectIndex;
  final double spacing;
  final Widget Function(bool selected, int index, BuildContext context)
      itemBuilder;

  const GridList(
      {Key? key,
      this.rowNumber = 4,
      this.selectedIndex = 0,
      this.onSelectIndex,
      required this.itemBuilder,
      this.count,
      this.spacing = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rowNumber,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      itemBuilder: (context, index) {
        Widget item = itemBuilder(selectedIndex == index, index, context);
        return InkWell(
          onTap: () {
            onSelectIndex!(index);
          },
          child: item,
        );
      },
    ).pad(all: spacing);
  }
}
