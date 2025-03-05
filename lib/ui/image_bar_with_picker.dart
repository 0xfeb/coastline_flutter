import 'dart:io';
//import 'dart:async';

import 'package:coastline/draw/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import './widget_extra.dart';
import './multi_widget.dart';
import './clip.dart';
import '../draw/path_extra.dart';

/// 带图片选择功能的图像展示栏组件
///
/// [onUpdate] 图片路径更新时的回调函数，接收新的图片路径
class ImageBarWithPicker extends StatefulWidget {
  final Function(String?)? onUpdate;

  /// 构造方法
  ///
  /// [key] 组件唯一标识符
  /// [onUpdate] 图片路径变更回调函数
  ImageBarWithPicker({Key? key, this.onUpdate}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageBarWithPickerState();
  }
}

class _ImageBarWithPickerState extends State<ImageBarWithPicker> {
  String? _imagePath;
  ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return _imageFile == null ? _emptyBar() : _fullBar();
  }

  /// 加载并旋转图片文件
  ///
  /// 使用[FlutterExifRotation]处理图片方向，
  /// 更新_imageFile状态并触发界面重绘
  void loadImage() {
    if (_imagePath != null) {
      setState(() async {
        _imageFile = await FlutterExifRotation.rotateImage(path: _imagePath!);
      });
    }
  }

  /// 构建空状态界面
  ///
  /// 包含：
  /// - 相机拍摄按钮（灰色背景）
  /// - 相册选择按钮（三角形布局）
  Widget _emptyBar() {
    return <Positioned>[
      Icons.camera
          .icon(size: 50, color: Colors.white)
          .box(color: Colors.grey[800])
          .onTap(() async {
        XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);

        _imagePath = file?.path;
        loadImage();
        if (widget.onUpdate != null) {
          widget.onUpdate!(_imagePath);
        }
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
        _imagePath = file?.path;
        loadImage();
        if (widget.onUpdate != null) {
          widget.onUpdate!(_imagePath);
        }
      }).positioned(
        right: 0,
        top: 0,
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.width / 4,
      ),
    ].stack();
  }

  Widget _fullBar() {
    return <Positioned>[
      Image.file(_imageFile!, fit: BoxFit.cover)
          .box()
          .positioned(left: 0, right: 0, top: 0, bottom: 0),

      //
      /// 图片删除按钮
      ///
      /// 点击后：
      /// - 清空_imagePath状态
      /// - 触发界面回退到空状态
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
