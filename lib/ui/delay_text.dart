import 'dart:async';

delayText(
    {int wait = 5, required String text, required Function(String?) update}) {
  update(text);
  Timer(Duration(seconds: wait), () => update(null));
}
