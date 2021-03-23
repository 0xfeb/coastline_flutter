import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// >>> 文件路径类 >>>
class Path {
  static final Path _instance = Path._internal();
  factory Path() {
    return _instance;
  }
  Path._internal();

  String _db;
  String _image;
  String _library;

  /// >>> 初始化路径的环境 >>>
  setup() async {
    if (_library != null) {
      return;
    }

    var dir = await getLibraryDirectory();
    _library = dir.path;

    _db = _library + '/storage.db';
    _image = _library + '/image/';

    Directory imageDir = Directory(_image);
    if (!imageDir.existsSync()) {
      imageDir.createSync(recursive: true);
    }
  }

  /// >>> 获得临时路径 >>>
  String get temp {
    if (_library == null) {
      throw Exception('Need run setup at first or use tempAsync');
    }

    final String uuid = Uuid().v4();
    return _library + '/$uuid';
  }

  /// >>> 获得临时路径, 如果未初始化, 会先初始化 >>>
  Future<String> get tempAsync async {
    await setup();
    return temp;
  }

  /// >>> 获得存储数据库目录 >>>
  String get db {
    if (_library == null) {
      throw Exception('Need run setup at first or use dbAsync');
    }

    return _db;
  }

  /// >>> 获得存储数据库目录, 如果未初始化, 会先初始化 >>>
  Future<String> get dbAsync async {
    await setup();
    return _db;
  }

  /// >>> 获得图片的文件名 >>>
  String imageFilename({String main}) {
    if (_library == null) {
      throw Exception('Need run setup at first or use imageFilenameAsync');
    }

    final String uuid = main ?? Uuid().v4();
    return _image + uuid;
  }

  /// >>> 获得图片的文件名, 如果未初始化, 会初始化 >>>
  Future<String> imageFilenameAsync({String main}) async {
    await setup();
    return imageFilename(main: main);
  }
}
