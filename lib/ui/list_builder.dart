import 'package:flutter/material.dart';

class ListBuilder {
  final Widget Function(BuildContext context, int index) itemBuilder;

  ListBuilder(this.itemBuilder);
}

extension ListBuilderWidget on ListBuilder {
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

  ListView listView({int count = 0, Widget gap = const SizedBox.shrink()}) {
    return ListView.separated(
        itemBuilder: (context, index) => itemBuilder(context, index),
        separatorBuilder: (context, index) => gap,
        itemCount: count);
  }
}
