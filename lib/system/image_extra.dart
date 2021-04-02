import 'dart:io';

import 'package:flutter/widgets.dart';
import 'path.dart';
import 'package:uuid/uuid.dart';

extension ImageExtra on FileImage {
  /// >>> 文件图像, 从Storage ID获取图像 >>>
  static FileImage fromStorageId(String storageId) {
    String destPath = FilePath().imageFilename(main: storageId);
    print('load image from -> $destPath');
    return FileImage(File(destPath));
  }

  /// >>> 文件图像, 从Storage ID获取图像, 同步 >>>
  static Future<FileImage> fromStorageIdAsync(String storageId) async {
    await FilePath().setup();
    return fromStorageId(storageId);
  }

  /// >>> 存储图像, 自动返回一个Storage ID >>>
  String save() {
    String uuid = Uuid().v4();
    String destFile = FilePath().imageFilename(main: uuid);
    if (!File(destFile).existsSync()) {
      File(destFile).createSync(recursive: true);
    }
    this.file.copySync(destFile);
    return uuid;
  }

  /// >>> 存储图像, 自动返回一个Storage ID, 同步 >>>
  Future<String> saveAsync() async {
    await FilePath().setup();
    return save();
  }

  /// >>> 拷贝一个文件到Storage ID >>>
  static copyToStorage(String sourcePath) {
    String uuid = Uuid().v4();
    String destFile = FilePath().imageFilename(main: uuid);
    File(sourcePath).copySync(destFile);
    return uuid;
  }

  /// >>> 拷贝一个文件到Storage ID, 同步 >>>
  static copyToStorageAsync(String sourcePath) async {
    await FilePath().setup();
    copyToStorage(sourcePath);
  }
}
