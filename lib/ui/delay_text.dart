import 'dart:async';

/// 延迟显示文本控件
///
/// 该函数会立即显示[text]内容，并在[wait]秒后自动清除显示内容
///
/// [wait] 等待时间（单位：秒），默认5秒
/// [text] 需要显示的文本内容
/// [update] 更新回调函数，接收String?类型参数：
///   - 当传入文本时显示内容
///   - 当传入null时清除显示
delayText(
    {int wait = 5, required String text, required Function(String?) update}) {
  update(text);
  Timer(Duration(seconds: wait), () => update(null));
}
