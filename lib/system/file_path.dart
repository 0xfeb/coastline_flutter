import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// >>> 文件路径类 >>>
class FilePath {
  static late String _db;
  static late String _image;
  static late String _library;
  static late String _temp;

  static bool loaded = false;

  /// 初始化路径的环境
  ///
  /// 该方法用于设置应用程序的文件路径，包括数据库路径、图像路径、库路径和临时路径。
  /// 如果环境变量 `FLUTTER_TEST` 设置为 `true`，则使用 `HOME` 环境变量作为库路径。
  /// 否则，根据平台类型（iOS、macOS、Android）获取相应的目录路径。
  static setup() async {
    if (loaded) return;

    if (Platform.environment['FLUTTER_TEST'] == "true") {
      String? home = Platform.environment['HOME'];
      _library = home!;
    } else {
      if (Platform.isIOS || Platform.isMacOS) {
        var dir = await getLibraryDirectory();
        _library = dir.path;
      } else if (Platform.isAndroid) {
        var dir = await getApplicationDocumentsDirectory();
        _library = dir.path;
      }
    }

    _db = _library + '/storage.db';
    _image = _library + '/image/';
    _temp = _library + '/${Uuid().v4()}/';

    Directory imageDir = Directory(_image);
    await imageDir.create(recursive: true);

    loaded = true;
  }
  /// 获取数据库文件路径
  ///
  /// Returns 数据库文件的路径。
  static String get db {
    return _db;
  }
  /// 获取临时文件路径
  ///
  /// Returns 临时文件目录的路径。
  static String get tempPath {
    return _temp;
  }
  /// 获取新的临时文件路径
  ///
  /// Returns 新的临时文件路径。
  static String get tempNewFile {
    return _temp + '${Uuid().v4()}';
  }
  /// 获取图像文件路径
  ///
  /// Returns 图像文件目录的路径。
  static String get imagePath {
    return _image;
  }
  /// 获取新的图像文件路径
  ///
  /// Returns 新的图像文件路径。
  static String get imageNewFile {
    return _image + '${Uuid().v4()}';
  }
  /// 获取库文件路径
  ///
  /// Returns 库文件目录的路径。
  static String get libraryPath {
    return _library;
  }
  /// 异步获取数据库文件路径
  ///
  /// Returns 一个 Future 对象，表示异步操作的结果，返回数据库文件的路径。
  static Future<String> get dbAsync async {
    await setup();
    return db;
  }
  /// 异步获取临时文件路径
  ///
  /// Returns 一个 Future 对象，表示异步操作的结果，返回临时文件目录的路径。
  static Future<String> get tempPathAsync async {
    await setup();
    return tempPath;
  }
  /// 异步获取新的临时文件路径
  ///
  /// Returns 一个 Future 对象，表示异步操作的结果，返回新的临时文件路径。
  static Future<String> get tempNewFileAsync async {
    await setup();
    return tempNewFile;
  }
  /// 异步获取图像文件路径
  ///
  /// Returns 一个 Future 对象，表示异步操作的结果，返回图像文件目录的路径。
  static Future<String> get imagePathAsync async {
    await setup();
    return imagePath;
  }
  /// 异步获取新的图像文件路径
  ///
  /// Returns 一个 Future 对象，表示异步操作的结果，返回新的图像文件路径。
  static Future<String> get imageNewFileAsync async {
    await setup();
    return imageNewFile;
  }
  /// 异步获取库文件路径
  ///
  /// Returns 一个 Future 对象，表示异步操作的结果，返回库文件目录的路径。
  static Future<String> get libraryPathAsync async {
    await setup();
    return libraryPath;
  }
}