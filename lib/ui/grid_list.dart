import 'package:flutter/material.dart';
import 'pad.dart';

/// >>> 显示格式列表控件 >>>
/// 网格布局列表控件
///
/// 支持自定义行数、间距和选中交互，通过[itemBuilder]构建子项内容
///
/// {@tool snippet}
/// 示例用法:
/// ```dart
/// GridList(
///   rowNumber: 3,
///   selectedIndex: _currentIndex,
///   onSelectIndex: (index) => setState(() => _currentIndex = index),
///   itemBuilder: (selected, index, context) => _buildGridItem(selected),
///   count: 12,
/// )
/// ```
/// {@end-tool}
class GridList extends StatelessWidget {
  /// 每行显示的元素数量
  final int rowNumber;

  /// 当前选中项的索引
  final int selectedIndex;

  /// 总项目数（可选，未设置时根据布局自动计算）
  final int? count;

  /// 选中项变更回调函数
  final Function(int)? onSelectIndex;

  /// 网格间距（单位：像素）
  final double spacing;

  /// 子项构建器
  ///
  /// @param selected 当前项是否被选中
  /// @param index 当前项的索引
  /// @param context 构建上下文
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

  /// 构建网格布局
  ///
  /// 使用[GridView.builder]实现动态布局，通过[SliverGridDelegateWithFixedCrossAxisCount]
  /// 控制网格参数，[InkWell]包裹子项处理点击交互
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
