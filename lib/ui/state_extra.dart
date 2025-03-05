import 'package:flutter/material.dart';

/// 弹窗返回值封装类
///
/// 包含实际返回值及是否需要更新界面的标志
class PopValue<T> {
  final T t;
  final bool needUpdate;

  PopValue(this.t, this.needUpdate);
}

/// 数据加载状态枚举
///
/// 包含初始化、加载中、加载完成、销毁四个状态
enum LoadState {
  init,
  loading,
  loaded,
  distroied,
}

/// State扩展方法
///
/// 提供数据加载和弹窗返回的便捷方法
extension StateHelper<T> on State {
  /// 带状态管理的异步数据加载方法
///
/// @param onState 状态回调函数（接收LoadState参数）
/// @param action 实际执行的异步操作
/// @return Future<void> 异步操作结果
loadData(Function(LoadState) onState, Function() action) async {
    onState(LoadState.init);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (mounted) {
        onState(LoadState.loading);
        await action();
        onState(LoadState.loaded);
      }
    });
  }

  /// 带返回值的导航弹出方法
///
/// @param value 要返回的值
/// @param updateScreen 是否需要更新界面（默认false）
/// @return void
pop(T value, {bool updateScreen = false}) {
    Navigator.of(context).pop(PopValue(value, updateScreen));
  }
}
