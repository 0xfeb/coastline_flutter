
import 'package:flutter/material.dart';

extension IconsExtra on IconData {
  Icon icon({Color color = Colors.black, double size = 20}) {
    return Icon(this, color: color, size: size);
  }
}