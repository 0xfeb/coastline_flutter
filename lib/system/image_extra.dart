import 'dart:io';

import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

import 'file_path.dart';

/// 根据Storage ID获取图像
/// 
/// [storageId] 图像的存储ID
/// 返回 [FileImage] 对象，如果文件不存在则返回null
FileImage? imageFromId(String storageId) {
  String destPath = FilePath.imagePath + storageId;
  print('load image from -> $destPath');
  File file = File(destPath);
  if (file.existsSync()) {
    return FileImage(file);
  } else {
    print('image file not exists!');
    return null;
  }
}

/// 根据Storage ID异步获取图像
/// 
/// [storageId] 图像的存储ID
/// 返回 [Future<FileImage?>] 对象，如果文件不存在则返回null
Future<FileImage?> imageFromIdAsync(String storageId) async {
  await FilePath.setup();
  return imageFromId(storageId);
}

/// 将文件拷贝到Storage ID
/// 
/// [sourcePath] 源文件路径
/// 返回 [String] 存储ID，如果文件不存在则返回null
String? imageToStorage(String sourcePath) {
  String uuid = Uuid().v4();
  String destFile = FilePath.imagePath + uuid;
  File file = File(sourcePath);
  if (file.existsSync()) {
    file.copySync(destFile);
    return uuid;
  } else {
    return null;
  }
}

/// 将文件异步拷贝到Storage ID
/// 
/// [sourcePath] 源文件路径
/// 返回 [Future<String?>] 存储ID，如果文件不存在则返回null
Future<String?> imageToStorageAsync(String sourcePath) async {
  await FilePath.setup();
  return imageToStorage(sourcePath);
}

/// 表示存储图像的类
class StorageImage {
  /// 存储ID
  String storageId;

  /// 构造函数
  /// 
  /// [storageId] 存储ID
  StorageImage(this.storageId);

  /// 根据路径创建StorageImage对象
  /// 
  /// [sourcePath] 源文件路径
  /// 返回 [StorageImage] 对象，如果文件不存在则返回null
  static StorageImage? fromPath(String sourcePath) {
    String? sid = imageToStorage(sourcePath);
    if (sid == null) {
      return null;
    }
    return StorageImage(sid);
  }

  /// 加载图像
  /// 
  /// 返回 [FileImage] 对象
  FileImage? loadImage() {
    return imageFromId(storageId);
  }
}

/// 扩展FileImage类，添加存储图像的方法
extension ImageExtra on FileImage {
  /// 将图像保存到存储并返回存储ID
  /// 
  /// 返回 [String] 存储ID
  String saveToStorage() {
    String uuid = Uuid().v4();
    String destFile = FilePath.imagePath + uuid;
    if (!File(destFile).existsSync()) {
      File(destFile).createSync(recursive: true);
    }
    this.file.copySync(destFile);
    return uuid;
  }

  /// 异步将图像保存到存储并返回存储ID
  /// 
  /// 返回 [Future<String>] 存储ID
  Future<String> saveToStorageAsync() async {
    await FilePath.setup();
    return saveToStorage();
  }
}