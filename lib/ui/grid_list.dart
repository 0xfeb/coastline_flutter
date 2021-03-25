import 'package:flutter/material.dart';

/// >>> 显示格式列表控件 >>>
class GridList extends StatelessWidget {
  final int rowNumber;
  final int selectedIndex;
  final Function(int) onSelectIndex;
  final Widget Function(bool selected, int index, BuildContext context)
      itemBuilder;

  const GridList(
      {Key key,
      this.rowNumber = 4,
      this.selectedIndex = 0,
      this.onSelectIndex,
      @required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rowNumber,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        Widget item = itemBuilder(selectedIndex == index, index, context);
        return InkWell(
          onTap: () {
            onSelectIndex(index);
          },
          child: item,
        );
      },
    );
  }
}
