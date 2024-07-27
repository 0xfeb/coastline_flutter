import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../lib/system/file.dart';

//todo: 未通过测试

void main() {
  group('CFile Tests', () {
    final tempDir = Directory.systemTemp.createTempSync('cfile_test_');
    final filePath = '${tempDir.path}${Platform.pathSeparator}testfile.txt';
    final dirPath = '${tempDir.path}${Platform.pathSeparator}testdir';
    final subFilePath =
        '${tempDir.path}${Platform.pathSeparator}testdir${Platform.pathSeparator}subfile.txt';
    final subDirPath =
        '${tempDir.path}${Platform.pathSeparator}testdir${Platform.pathSeparator}subdir';

    setUp(() {
      // Ensure clean state before each test
      if (File(filePath).existsSync()) File(filePath).deleteSync();
      if (Directory(dirPath).existsSync()) {
        print('aaaaaa');
        Directory(dirPath).deleteSync(recursive: true);
      }
    });

    test('createFile creates a file', () {
      final cfile = CFile(filePath);
      cfile.createFile();
      expect(cfile.isExist, isTrue);
      expect(cfile.isFile, isTrue);
    });

    test('createPath creates a directory', () {
      final cfile = CFile(dirPath);
      cfile.createPath();
      cfile.createSubFile('subfile.txt');
      expect(cfile.isExist, isTrue);
      expect(cfile.isDirectory, isTrue);
    });

    test('createSubFile creates a subfile', () {
      final cfile = CFile(dirPath);
      print(cfile.filename);
      cfile.createPath(); // Ensure parent directory exists
      cfile.createSubFile('subfile.txt');
      expect(CFile(subFilePath).isExist, isTrue);
    });

    test('createSubPath creates a subdirectory', () {
      final cfile = CFile(dirPath);
      cfile.createPath(); // Ensure parent directory exists
      cfile.createSubPath('subdir');
      expect(CFile(subDirPath).isExist, isTrue);
    });

    test('remove deletes a file', () {
      final cfile = CFile(filePath);
      cfile.createFile(); // Ensure file exists
      cfile.remove();
      expect(cfile.isExist, isFalse);
    });

    test('removeSub deletes a subfile', () {
      final cfile = CFile(dirPath);
      cfile.createPath(); // Ensure parent directory exists
      cfile.createSubFile('subfile.txt'); // Ensure subfile exists
      cfile.removeSub('subfile.txt');
      expect(CFile(subFilePath).isExist, isFalse);
    });

    test('parent returns the parent directory', () {
      final cfile = CFile(subFilePath);
      expect(cfile.parent.filename, equals(dirPath));
    });

    test('subFile returns a subfile', () {
      final cfile = CFile(dirPath);
      expect(cfile.subFile('subfile.txt').filename, equals(subFilePath));
    });

    test('slibing returns a sibling file', () {
      final cfile = CFile(subFilePath);
      expect(cfile.slibing('siblingfile.txt').filename,
          equals('${tempDir.path}${Platform.pathSeparator}siblingfile.txt'));
    });

    test('moveTo moves a file', () {
      final cfile = CFile(filePath);
      cfile.createFile(); // Ensure file exists
      final newPath = '${tempDir.path}/movedfile.txt';
      cfile.moveTo(newPath);
      expect(CFile(newPath).isExist, isTrue);
      expect(cfile.isExist, isFalse);
    });

    test('copyTo copies a file', () {
      final cfile = CFile(filePath);
      cfile.createFile(); // Ensure file exists
      final copyPath = '${tempDir.path}/copyfile.txt';
      cfile.copyTo(copyPath);
      expect(CFile(copyPath).isExist, isTrue);
      expect(cfile.isExist, isTrue);
    });

    test('isFile returns true for a file', () {
      final cfile = CFile(filePath);
      cfile.createFile(); // Ensure file exists
      expect(cfile.isFile, isTrue);
    });

    test('isDirectory returns true for a directory', () {
      final cfile = CFile(dirPath);
      cfile.createPath(); // Ensure directory exists
      expect(cfile.isDirectory, isTrue);
    });

    test('lines returns lines from a file', () {
      final cfile = CFile(filePath);
      cfile.createFile(); // Ensure file exists
      File(filePath).writeAsStringSync('Line1\nLine2\nLine3');
      expect(cfile.lines, equals(['Line1', 'Line2', 'Line3']));
    });

    test('files returns list of CFiles in a directory', () {
      final cfile = CFile(dirPath);
      cfile.createPath(); // Ensure directory exists
      cfile.createSubFile('file1.txt');
      cfile.createSubFile('file2.txt');
      expect(cfile.files.length, equals(2));
    });

    tearDown(() {
      tempDir.deleteSync(recursive: true);
    });
  });
}
