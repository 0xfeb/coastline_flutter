import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import 'file_path.dart';

extension ImageProviderExtra on ImageProvider {
  Future<ui.Image> _toImage() async {
    Completer<ui.Image> completer = Completer<ui.Image>();
    ImageStreamListener listener;
    ImageStream stream = this.resolve(ImageConfiguration.empty);
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener);
    });
    stream.addListener(listener);
    return completer.future;
  }

  /// >>> 存储到文件中去 >>>
  Future save(String filePath) async {
    ui.Image image = await _toImage();
    var bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List ul = bytes.buffer.asUint8List();
    File file = File(filePath);
    file.openWrite();
    file.writeAsBytesSync(ul);
  }

  /// >>> 存储到特定Storage库中去 >>>
  Future<String> saveToStorage({String storageId}) async {
    await FilePath().setup();
    String uuid = storageId ?? Uuid().v4();
    String destFile = FilePath().imageFilename(uuid);
    await save(destFile);

    return uuid;
  }
}
