import 'package:flutter/material.dart';

/// 列表构建器组件
///
/// 提供声明式构建列表项的通用模式，支持SliverList和ListView两种布局形式
class ListBuilder {
  /// 列表项构建器
  ///
  /// @param context 构建上下文
  /// @param index 当前项的索引位置
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// 创建列表构建器
  ///
  /// @param itemBuilder 列表项构建回调函数
  ListBuilder(this.itemBuilder);
}

extension ListBuilderWidget on ListBuilder {
  /// 构建Sliver列表布局
  ///
  /// @param count 列表项总数
  /// @param gap 列表项之间的间隔组件
  /// @return 返回SliverList布局组件
  SliverList sliverList({int count = 0, Widget gap = const SizedBox.shrink()}) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      if (index == 0) {
        return itemBuilder(context, index);
      } else {
        return Column(
          children: [
            gap,
            itemBuilder(context, index),
          ],
        );
      }
    }, childCount: count));
  }

  /// 构建常规列表布局
  ///
  /// @param count 列表项总数
  /// @param gap 列表项之间的间隔组件
  /// @return 返回ListView布局组件
  ListView listView({int count = 0, Widget gap = const SizedBox.shrink()}) {
    return ListView.separated(
        itemBuilder: (context, index) => itemBuilder(context, index),
        separatorBuilder: (context, index) => gap,
        itemCount: count);
  }
}
