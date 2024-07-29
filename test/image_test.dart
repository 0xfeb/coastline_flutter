import 'dart:io';

import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import 'package:coastline/system/file_path.dart';

import '../lib/system/image_extra.dart';

void main() {
  setUp(() {
    // Mock setup if needed
  });

  group('imageFromId', () {
    test('should return FileImage if file exists', () {
      String storageId = Uuid().v4();
      String destPath = FilePath.imagePath + storageId;
      File file = File(destPath);
      file.createSync();

      expect(imageFromId(storageId), isA<FileImage>());
      file.deleteSync();
    });

    test('should return null if file does not exist', () {
      String storageId = Uuid().v4();
      expect(imageFromId(storageId), isNull);
    });
  });

  group('imageToStorage', () {
    test('should return storage ID if file exists', () {
      String sourcePath = 'test_image.jpg';
      File file = File(sourcePath);
      file.createSync();

      String? storageId = imageToStorage(sourcePath);
      expect(storageId, isNotNull);
      file.deleteSync();
      File(FilePath.imagePath + storageId!).deleteSync();
    });

    test('should return null if file does not exist', () {
      String sourcePath = 'non_existent_file.jpg';
      expect(imageToStorage(sourcePath), isNull);
    });
  });

  group('StorageImage', () {
    test('fromPath should return StorageImage if file exists', () {
      String sourcePath = 'test_image.jpg';
      File file = File(sourcePath);
      file.createSync();

      StorageImage? storageImage = StorageImage.fromPath(sourcePath);
      expect(storageImage, isNotNull);
      file.deleteSync();
      File(FilePath.imagePath + storageImage!.storageId).deleteSync();
    });

    test('fromPath should return null if file does not exist', () {
      String sourcePath = 'non_existent_file.jpg';
      expect(StorageImage.fromPath(sourcePath), isNull);
    });

    test('loadImage should return FileImage if file exists', () {
      String sourcePath = 'test_image.jpg';
      File file = File(sourcePath);
      file.createSync();

      StorageImage? storageImage = StorageImage.fromPath(sourcePath);
      expect(storageImage!.loadImage(), isA<FileImage>());
      file.deleteSync();
      File(FilePath.imagePath + storageImage.storageId).deleteSync();
    });
  });

  group('ImageExtra', () {
    test('saveToStorage should return storage ID', () {
      String sourcePath = 'test_image.jpg';
      File file = File(sourcePath);
      file.createSync();
      FileImage fileImage = FileImage(file);

      String storageId = fileImage.saveToStorage();
      expect(storageId, isNotNull);
      file.deleteSync();
      File(FilePath.imagePath + storageId).deleteSync();
    });
  });
}
