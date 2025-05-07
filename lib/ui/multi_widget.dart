import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 多控件布局扩展
///
/// 为Widget列表提供快速创建常见布局的扩展方法
/// 包含行、列、流式布局、列表视图、网格视图等多种布局方式的快捷实现
extension MultiWidget<T extends Widget> on List<T> {
  /// 创建水平排列布局
  ///
  /// @param mainAxisAlignment 主轴对齐方式（默认起始对齐）
  /// @param mainAxisSize 主轴尺寸策略（默认取最大可用空间）
  /// @param crossAxisAlignment 交叉轴对齐方式（默认居中对齐）
  /// @return 包含当前子控件的Row组件
  Row row({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Row(
      children: this,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  /// >>> 列 >>>
  Column column({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Column(
      children: this,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  /// >>> 流展示 >>>
  Flow flow(FlowDelegate delegate) {
    return Flow(
      delegate: delegate,
      children: this,
    );
  }

  /// >>> 展示的子内容 >>>
  ListBody listBody({required Axis axis, bool reverse = false}) {
    return ListBody(
      mainAxis: axis,
      reverse: reverse,
      children: this,
    );
  }

  /// >>> 分页 >>>
  PageView pageView(
      {Axis scrollDirection = Axis.vertical,
      bool reverse = false,
      PageController? controller,
      ScrollPhysics? physics,
      ValueChanged<int>? onPageChanged}) {
    return PageView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      physics: physics,
      onPageChanged: onPageChanged,
    );
  }

  /// >>> 列表 >>>
  ListView listView({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    ScrollPhysics? physics,
    double? itemExtent,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.onDrag,
  }) {
    return ListView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      physics: physics,
      itemExtent: itemExtent,
      keyboardDismissBehavior: keyboardDismissBehavior,
      children: this,
    );
  }

  /// >>> 表格 >>>
  GridView gridViewByDelegate({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    required SliverGridDelegate gridDelegate,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.onDrag,
  }) {
    return GridView(
      gridDelegate: gridDelegate,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      physics: physics,
      padding: padding,
      keyboardDismissBehavior: keyboardDismissBehavior,
      children: this,
    );
  }

  /// >>> 表格 >>>
  GridView gridViewByCount({
    required int crossAxisCount,
    required double mainAxisSpacing,
    required double crossAxisSpacing,
    required double childAspectRatio,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.onDrag,
  }) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      physics: physics,
      padding: padding,
      keyboardDismissBehavior: keyboardDismissBehavior,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
      children: this,
    );
  }

  /// >>> 表格 >>>
  GridView gridViewByLimit({
    required double crossAxisLimit,
    required double mainAxisSpacing,
    required double crossAxisSpacing,
    required double childAspectRatio,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.onDrag,
  }) {
    return GridView.extent(
      maxCrossAxisExtent: crossAxisLimit,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      physics: physics,
      padding: padding,
      keyboardDismissBehavior: keyboardDismissBehavior,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
      children: this,
    );
  }

  /// >>> CustomScrollView专用内容 >>>
  SliverList sliverList() {
    return SliverList(delegate: SliverChildListDelegate(this));
  }

  /// >>> 换行控件 >>>
  Wrap wrap(
      {Key? key,
      Axis direction = Axis.horizontal,
      WrapAlignment alignment = WrapAlignment.start,
      double spacing = 4,
      WrapAlignment runAlignment = WrapAlignment.start,
      double runSpacing = 4,
      WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
      TextDirection? textDirection,
      VerticalDirection verticalDirection = VerticalDirection.down,
      Clip clipBehavior = Clip.hardEdge}) {
    return Wrap(
      key: key,
      children: this,
      direction: direction,
      alignment: alignment,
      spacing: spacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
    );
  }
}

/// >>> 堆栈控件 >>>
/// 堆叠布局扩展
///
/// 为Positioned控件列表提供快速创建堆叠布局的扩展方法
/// 适用于需要层叠显示多个控件的场景
extension StackExtra<T extends Positioned> on List<T> {
  /// 创建层叠布局
  ///
  /// @param alignment 子控件对齐方式（默认左上角对齐）
  /// @param fit 未定位子控件的尺寸适应策略（默认宽松适应）
  /// @return 包含当前子控件的Stack组件
  Stack stack(
      {AlignmentGeometry alignment = AlignmentDirectional.topStart,
      StackFit fit = StackFit.loose}) {
    return Stack(
      children: this,
      alignment: alignment,
      fit: fit,
    );
  }
}

/// >>> 直接从控件列表生成CustomScorllView >>>
/// 滚动布局扩展
///
/// 为Sliver控件列表提供快速创建自定义滚动视图的扩展方法
/// 适用于需要复杂滚动布局的场景
extension SliverExtra<T extends SliverWithKeepAliveWidget> on List<T> {
  /// 创建自定义滚动视图
  ///
  /// @param scrollDirection 滚动方向（默认垂直方向）
  /// @param reverse 是否反向滚动（默认false）
  /// @param controller 滚动控制器（可选）
  /// @param physics 滚动物理效果（可选）
  /// @param shrinkWrap 是否根据内容收缩包裹（默认false）
  /// @param clipBehavior 内容裁剪方式（默认硬裁剪）
  /// @return 包含当前Sliver组件的CustomScrollView
  CustomScrollView scrollView(
      {Key? key,
      Axis scrollDirection = Axis.vertical,
      bool reverse = false,
      ScrollController? controller,
      bool? primary,
      ScrollPhysics? physics,
      ScrollBehavior? scrollBehavior,
      bool shrinkWrap = false,
      Key? center,
      double anchor = 0.0,
      double? cacheExtent,
      int? semanticChildCount,
      DragStartBehavior dragStartBehavior = DragStartBehavior.start,
      ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
          ScrollViewKeyboardDismissBehavior.onDrag,
      String? restorationId,
      Clip clipBehavior = Clip.hardEdge}) {
    return CustomScrollView(
      slivers: this,
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      scrollBehavior: scrollBehavior,
      shrinkWrap: shrinkWrap,
      center: center,
      anchor: anchor,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
    );
  }
}
