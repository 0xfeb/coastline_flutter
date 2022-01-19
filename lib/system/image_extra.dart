import 'dart:io';

import 'package:flutter/widgets.dart';
import 'file_path.dart';
import 'package:uuid/uuid.dart';

/// >>> 文件图像, 从Storage ID获取图像 >>>
FileImage? loadStorageImage(String storageId) {
  String destPath = FilePath().imageFilename(storageId);
  print('load image from -> $destPath');
  File file = File(destPath);
  if (file.existsSync()) {
    return FileImage(file);
  } else {
    print('image file not exists!');
    return null;
  }
}

/// >>> 文件图像, 从Storage ID获取图像, 同步 >>>
Future<FileImage?> loadStorageImageAsync(String storageId) async {
  await FilePath().setup();
  return loadStorageImage(storageId);
}

/// >>> 拷贝一个文件到Storage ID >>>
String? loadPathCopyToStorageImage(String sourcePath) {
  String uuid = Uuid().v4();
  String destFile = FilePath().imageFilename(uuid);
  File file = File(sourcePath);
  if (file.existsSync()) {
    file.copySync(destFile);
    return uuid;
  } else {
    return null;
  }
}

/// >>> 拷贝一个文件到Storage ID, 同步 >>>
Future<String?> loadPathCopyToStorageImageAsync(String sourcePath) async {
  await FilePath().setup();
  return loadPathCopyToStorageImage(sourcePath);
}

class StorageImage {
  String storageId;

  StorageImage(this.storageId);
  static StorageImage? fromPath(String sourcePath) {
    String? sid = loadPathCopyToStorageImage(sourcePath);
    if (sid == null) {
      return null;
    }
    return StorageImage(sid);
  }

  FileImage? loadImage() {
    return loadStorageImage(storageId);
  }
}

extension ImageExtra on FileImage {
  /// >>> 存储图像, 自动返回一个Storage ID >>>
  String save() {
    String uuid = Uuid().v4();
    String destFile = FilePath().imageFilename(uuid);
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
}
