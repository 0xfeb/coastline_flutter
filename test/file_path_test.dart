import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../lib/system/file_path.dart';

void main() {
  group('FilePath Tests', () {
    setUp(() async {
      // Set up any test specific configurations
      // Platform.environment['FLUTTER_TEST'] = "true";
      // Platform.environment['HOME'] = Directory.current.path;
      await FilePath.setup();
    });

    test('Happy Path - Check if setup initializes paths correctly', () async {
      expect(FilePath.db, isNotEmpty);
      expect(FilePath.tempPath, isNotEmpty);
      expect(FilePath.tempNewFile, isNotEmpty);
      expect(FilePath.imagePath, isNotEmpty);
      expect(FilePath.imageNewFile, isNotEmpty);
      expect(FilePath.libraryPath, isNotEmpty);
    });

    test('Edge Case - Check if paths are unique', () async {
      expect(FilePath.tempNewFile, isNot(equals(FilePath.tempNewFile)));
      expect(FilePath.imageNewFile, isNot(equals(FilePath.imageNewFile)));
    });

    test('Edge Case - Check if setup is idempotent', () async {
      String dbBefore = FilePath.db;
      String tempPathBefore = FilePath.tempPath;
      String imagePathBefore = FilePath.imagePath;
      String libraryPathBefore = FilePath.libraryPath;

      await FilePath.setup();

      expect(FilePath.db, equals(dbBefore));
      expect(FilePath.tempPath, equals(tempPathBefore));
      expect(FilePath.imagePath, equals(imagePathBefore));
      expect(FilePath.libraryPath, equals(libraryPathBefore));
    });

    test('Edge Case - Check if paths are correctly formed', () async {
      expect(FilePath.db, endsWith('/storage.db'));
      expect(FilePath.tempPath, endsWith('/'));
      expect(FilePath.imagePath, endsWith('/image/'));
    });

    test('Edge Case - Check if directories are created', () async {
      Directory imageDir = Directory(FilePath.imagePath);
      expect(await imageDir.exists(), isTrue);
    });
  });
}
