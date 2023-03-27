import 'dart:io';

class CFile {
  String filename;

  CFile(this.filename);

  bool get isExist {
    return File(filename).existsSync();
  }

  createFile() {
    File(filename).createSync(recursive: true);
  }

  createPath() {
    Directory(filename).createSync(recursive: true);
  }

  createSubFile(String subname) {
    File('$filename/$subname').createSync(recursive: true);
  }

  createSubPath(String subname) {
    Directory('$filename/$subname').createSync(recursive: true);
  }

  remove() {
    File(filename).deleteSync();
  }

  removeSub(String subname) {
    File('$filename/$subname').deleteSync();
  }

  CFile get parent {
    return CFile(Directory(filename).parent.path);
  }

  CFile subFile(String subname) {
    return CFile('$filename/$subname');
  }

  CFile slibing(String name) {
    return CFile('${parent.filename}/$name');
  }

  moveTo(String dest) {
    File(filename).renameSync(dest);
  }

  copyTo(String dest) {
    File(filename).copySync(dest);
  }

  bool get isFile {
    return File(filename).statSync().type == FileSystemEntityType.file;
  }

  bool get isDirectory {
    return File(filename).statSync().type == FileSystemEntityType.directory;
  }

  List<String> get lines {
    return File(filename).readAsLinesSync();
  }

  List<CFile> get files {
    return Directory(filename).listSync().map((e) => CFile(e.path)).toList();
  }
}

extension FileString on String {
  CFile get filePath {
    return CFile(this);
  }
}
