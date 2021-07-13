import 'package:flutter/material.dart';

extension MultiWidget<T extends Widget> on List<T> {
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

  Stack stack(
      {AlignmentGeometry alignment = AlignmentDirectional.topStart,
      StackFit fit = StackFit.loose}) {
    return Stack(
      children: this,
      alignment: alignment,
      fit: fit,
    );
  }

  Flow flow(FlowDelegate delegate) {
    return Flow(
      delegate: delegate,
      children: this,
    );
  }

  ListBody listBody({required Axis axis, bool reverse = false}) {
    return ListBody(
      mainAxis: axis,
      reverse: reverse,
      children: this,
    );
  }

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
}
