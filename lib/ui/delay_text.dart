import 'dart:async';

import 'package:flutter/material.dart';

delayText(
    {int wait = 5, required String text, required Function(String?) update}) {
  update(text);
  Timer(Duration(seconds: wait), () => update(null));
}
