import 'package:flutter/material.dart';

/// >>> 空隙元素 >>>
/// 创建指定尺寸的空白占位元素
///
/// 通过[SizedBox]实现宽高一致的布局间隔，适用于常规布局场景
class Gap extends StatelessWidget {
  /// 空隙尺寸，同时作用于宽高
  final double size;

  /// 构造指定尺寸的空白元素
  /// @param size 空白区域的尺寸（单位：逻辑像素）
  Gap(this.size);

  @override

  /// 构建布局组件
  /// @return 返回包含指定尺寸的[SizedBox]组件
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}

/// 用于Sliver布局的空白占位元素
///
/// 将[Gap]适配为Sliver布局组件，适用于CustomScrollView等滚动布局场景
class SliverGap extends StatelessWidget {
  /// 空隙尺寸，同时作用于宽高
  final double size;

  /// 构造指定尺寸的Sliver空白元素
  /// @param size 空白区域的尺寸（单位：逻辑像素）
  SliverGap(this.size);

  @override

  /// 构建Sliver布局组件
  /// @return 返回包含[Gap]的[SliverToBoxAdapter]组件
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Gap(size));
  }
}
