import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './widget_extra.dart';
import '../draw/icon.dart';
import './multi_widget.dart';
import './clip.dart';
import '../draw/path_extra.dart';

class CImagePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CImagePickerState();
  }
}

class _CImagePickerState extends State<CImagePicker> {
  String? _imagePath;
  ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return _imagePath == null ? _emptyBar() : _fullBar();
  }

  Widget _emptyBar() {
    return <Widget>[
      Icons.camera
          .icon(size: 50, color: Colors.white)
          .box(color: Colors.grey[800])
          .onTap(() async {
        XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          _imagePath = file?.path;
        });
      }).positioned(left: 0, right: 0, top: 0, bottom: 0),

      //List<Offset>
      Icons.photo_album
          .icon(size: 30, color: Colors.white)
          .offset(x: 0.7, y: 0.3)
          .box(color: Colors.grey[400])
          .clipPath((size) {
        return <Offset>[
          Offset(0, 0),
          Offset(size.width, 0),
          Offset(size.width, size.width),
        ].polygonPath();
      }).onTap(() async {
        XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
          _imagePath = file?.path;
        });
      }).positioned(
              right: 0,
              top: 0,
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4),
    ].stack();
  }

  Widget _fullBar() {
    return <Widget>[
      Image.file(File(_imagePath!))
          .box()
          .positioned(left: 0, right: 0, top: 0, bottom: 0),

      //
      Icons.remove
          .icon(size: 10, color: Colors.white)
          .box(color: Colors.red)
          .clipPath((size) => <Offset>[
                Offset(0, 0),
                Offset(size.width, 0),
                Offset(size.width, size.height)
              ].polygonPath())
          .onTap(() {
        setState(() {
          _imagePath = null;
        });
      }).positioned(top: 0, right: 0, width: 15, height: 15),
    ].stack();
  }
}
