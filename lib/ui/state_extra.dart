import 'package:flutter/material.dart';

class PopValue<T> {
  final T t;
  final bool needUpdate;

  PopValue(this.t, this.needUpdate);
}

enum LoadState {
  init,
  loading,
  loaded,
  distroied,
}

extension StateHelper<T> on State {
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

  pop(T value, {bool updateScreen = false}) {
    Navigator.of(context).pop(PopValue(value, updateScreen));
  }
}
