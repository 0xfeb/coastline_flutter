import 'package:flutter/material.dart';

class ImagePickerController extends ChangeNotifier {
  // ignore: unused_field
  String? _imagePath;

  updateImagePath(String? imagePath) {
    _imagePath = imagePath;
    notifyListeners();
  }
}
