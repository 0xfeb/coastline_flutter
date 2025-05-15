import 'package:flutter/widgets.dart';

/// 在initState中加入本动作, 那么, 窗口中所有控件执行完毕后, 会调用[afterLoadView]函数
setupView(Function() afterLoadView) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Future.microtask(afterLoadView);
  });
}
