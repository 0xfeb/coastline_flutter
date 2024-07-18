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

  /// >>> 初始化路径的环境 >>>
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
        //PackageInfo packageInfo = await PackageInfo.fromPlatform();
        //var pkgName = packageInfo.packageName;
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

  static String get db {
    return _db;
  }

  static String get tempPath {
    return _temp;
  }

  static String get tempNewFile {
    return _temp + '${Uuid().v4()}';
  }

  static String get imagePath {
    return _image;
  }

  static String get imageNewFile {
    return _image + '${Uuid().v4()}';
  }

  static String get libraryPath {
    return _library;
  }

  static Future<String> get dbAsync async {
    await setup();
    return db;
  }

  static Future<String> get tempPathAsync async {
    await setup();
    return tempPath;
  }

  static Future<String> get tempNewFileAsync async {
    await setup();
    return tempNewFile;
  }

  static Future<String> get imagePathAsync async {
    await setup();
    return imagePath;
  }

  static Future<String> get imageNewFileAsync async {
    await setup();
    return imageNewFile;
  }

  static Future<String> get libraryPathAsync async {
    await setup();
    return libraryPath;
  }
}
