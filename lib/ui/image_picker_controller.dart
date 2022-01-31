import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ImagePickerController extends ChangeNotifier {
  String? _imagePath;

  updateImagePath(String? imagePath) {
    _imagePath = imagePath;
    notifyListeners();
  }
}
