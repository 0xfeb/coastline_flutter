
import 'package:flutter/cupertino.dart';

class CImagePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CImagePickerState();
  }

}

class _CImagePickerState extends State<CImagePicker> {
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return _imagePath == null ?  _emptyBar() : _fullBar();
  }

  Widget _emptyBar() {
    return Text('');
  }

  Widget _fullBar() {
    return Text('');
  }
}