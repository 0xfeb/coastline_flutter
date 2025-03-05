import 'dart:io';

/// 表示一个文件或目录的类。
class CFile {
  /// 文件或目录的路径。
  String filename;

  /// 构造函数，初始化文件或目录的路径。
  /// 
  /// [filename] 文件或目录的路径。
  CFile(this.filename);

  /// 检查文件或目录是否存在。
  /// 
  /// 返回一个布尔值，表示文件或目录是否存在。
  bool get isExist {
    return File(filename).existsSync();
  }

  /// 创建一个空文件。
  /// 
  /// 如果文件的父目录不存在，会自动创建。
  void createFile() {
    File(filename).createSync(recursive: true);
  }

  /// 创建一个目录。
  /// 
  /// 如果目录的父目录不存在，会自动创建。
  void createPath() {
    print(Directory(filename));
    try {
      Directory(filename).createSync(recursive: true);
    } catch (e) {
      print(e);
    }
  }

  /// 在当前目录下创建一个子文件。
  /// 
  /// [subname] 子文件的名称。
  void createSubFile(String subname) {
    File('$filename${Platform.pathSeparator}$subname')
        .createSync(recursive: true);
  }

  /// 在当前目录下创建一个子目录。
  /// 
  /// [subname] 子目录的名称。
  void createSubPath(String subname) {
    Directory('$filename${Platform.pathSeparator}$subname')
        .createSync(recursive: true);
  }

  /// 删除当前文件或目录。
  void remove() {
    File(filename).deleteSync();
  }

  /// 删除当前目录下的指定子文件。
  /// 
  /// [subname] 子文件的名称。
  void removeSub(String subname) {
    File('$filename${Platform.pathSeparator}$subname').deleteSync();
  }

  /// 获取当前文件或目录的父目录。
  /// 
  /// 返回一个`CFile`对象，表示父目录。
  CFile get parent {
    return CFile(Directory(filename).parent.path);
  }

  /// 获取当前目录下的指定子文件。
  /// 
  /// [subname] 子文件的名称。
  /// 
  /// 返回一个`CFile`对象，表示子文件。
  CFile subFile(String subname) {
    return CFile('$filename${Platform.pathSeparator}$subname');
  }

  /// 获取当前目录下的指定同级文件或目录。
  /// 
  /// [name] 同级文件或目录的名称。
  /// 
  /// 返回一个`CFile`对象，表示同级文件或目录。
  CFile slibing(String name) {
    return CFile('${parent.filename}${Platform.pathSeparator}$name');
  }

  /// 将当前文件或目录移动到指定路径。
  /// 
  /// [dest] 目标路径。
  void moveTo(String dest) {
    File(filename).renameSync(dest);
  }

  /// 将当前文件复制到指定路径。
  /// 
  /// [dest] 目标路径。
  void copyTo(String dest) {
    File(filename).copySync(dest);
  }

  /// 检查当前路径是否为文件。
  /// 
  /// 返回一个布尔值，表示当前路径是否为文件。
  bool get isFile {
    return File(filename).statSync().type == FileSystemEntityType.file;
  }

  /// 检查当前路径是否为目录。
  /// 
  /// 返回一个布尔值，表示当前路径是否为目录。
  bool get isDirectory {
    return File(filename).statSync().type == FileSystemEntityType.directory;
  }

  /// 读取文件的所有行。
  /// 
  /// 返回一个字符串列表，表示文件的所有行。
  List<String> get lines {
    return File(filename).readAsLinesSync();
  }

  /// 获取目录下的所有文件和子目录。
  /// 
  /// 返回一个`CFile`对象列表，表示目录下的所有文件和子目录。
  List<CFile> get files {
    return Directory(filename).listSync().map((e) => CFile(e.path)).toList();
  }
}

/// 扩展String类，添加filePath属性。
extension FileString on String {
  /// 将字符串转换为`CFile`对象。
  /// 
  /// 返回一个`CFile`对象，表示当前字符串路径。
  CFile get filePath {
    return CFile(this);
  }
}