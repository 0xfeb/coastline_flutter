import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import 'package:uuid/uuid.dart';

import 'file_path.dart';

extension ImageProviderFileExtra on ImageProvider {
  /// 将ImageProvider转换为ui.Image对象
  /// 
  /// 返回一个Future<ui.Image>对象
  Future<ui.Image> _toImage() async {
    Completer<ui.Image> completer = Completer<ui.Image>();
    late ImageStreamListener listener;
    ImageStream stream = this.resolve(ImageConfiguration.empty);
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener);
    });
    stream.addListener(listener);
    return completer.future;
  }

  /// 获取Image对象
  /// 
  /// 返回一个Image对象
  Image get image {
    return Image(
      image: this,
      fit: BoxFit.cover,
    );
  }

  /// 将图像保存到指定文件路径
  /// 
  /// [filePath] 文件路径
  /// 返回一个Future对象
  Future saveToFile(String filePath) async {
    ui.Image image = await _toImage();
    var bytes = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData>);
    Uint8List ul = bytes.buffer.asUint8List();
    File file = File(filePath);
    file.openWrite();
    file.writeAsBytesSync(ul);
  }

  /// 将图像保存到特定Storage库中
  /// 
  /// [storageId] 存储ID，可选参数
  /// 返回一个Future<String>对象，表示存储ID
  Future<String> saveToStorage({String? storageId}) async {
    await FilePath.setup();
    String uuid = storageId ?? Uuid().v4();
    String destFile = FilePath.imagePath + uuid;
    await saveToFile(destFile);

    return uuid;
  }
}