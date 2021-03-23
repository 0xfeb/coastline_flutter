import 'dart:io';

import 'package:flutter/widgets.dart';
import 'path.dart';
import 'package:uuid/uuid.dart';

extension ImageExtra on FileImage {
  static FileImage fromStorageId(String storageId) {
    String destPath = Path().imageFilename(main: storageId);
    print('load image from -> $destPath');
    return FileImage(File(destPath));
  }

  static Future<FileImage> fromStorageIdAsync(String storageId) async {
    await Path().setup();
    return fromStorageId(storageId);
  }

  String save() {
    String uuid = Uuid().v4();
    String destFile = Path().imageFilename(main: uuid);
    if (!File(destFile).existsSync()) {
      File(destFile).createSync(recursive: true);
    }
    this.file.copySync(destFile);
    return uuid;
  }

  Future<String> saveAsync() async {
    await Path().setup();
    return save();
  }

  static copyToStorage(String sourcePath) {
    String uuid = Uuid().v4();
    String destFile = Path().imageFilename(main: uuid);
    File(sourcePath).copySync(destFile);
    return uuid;
  }

  static copyToStorageAsync(String sourcePath) async {
    await Path().setup();
    copyToStorage(sourcePath);
  }
}
