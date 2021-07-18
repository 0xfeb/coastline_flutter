import 'package:flutter/gestures.dart';
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

  SliverList sliverList() {
    return SliverList(delegate: SliverChildListDelegate(this));
  }

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
