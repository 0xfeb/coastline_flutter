import 'dart:io';
import 'type.dart';
import 'package:path/path.dart';

class FileLog {
  static final FileLog _filelog = FileLog._internal();
  factory FileLog() {
    return _filelog;
  }
  File _file;
  static String _logPath;
  FileLog._internal() {
    DateTime time = DateTime.now();
    String filename = "log/${time.year}_${time.month}_${time.day}.log";
    String path = join(_logPath, filename);
    _file = File(path);
  }

  static setupLogPath(String logPath) {
    Directory dir = Directory(logPath);
    if (!dir.existsSync()) {
      dir.createSync();
    }
    _logPath = logPath;
  }

  _log(String text, {int space = 0}) {
    String logText = ' '.repeat(space) + text;
    print(logText);
    _file.writeAsStringSync(logText, flush: true, mode: FileMode.append);
  }

  info(String text, {int space = 0}) => _log('[#] $text', space: space);

  wraning(String text, {int space = 0}) => _log('[?] $text', space: space);

  error(String text, {int space = 0}) => _log('[!] $text', space: space);

  sql(String text, {int space = 0}) => _log('<DB> $text', space: space);

  http(String text, {int space = 0}) => _log('<@> $text', space: space);

  ui(String text, {int space = 0}) => _log('<UI> $text', space: space);
}

logInfo(String text, {int space = 0}) => FileLog().info(text, space: space);
logWraning(String text, {int space = 0}) => FileLog().info(text, space: space);
logError(String text, {int space = 0}) => FileLog().info(text, space: space);
logSql(String text, {int space = 0}) => FileLog().info(text, space: space);
logHttp(String text, {int space = 0}) => FileLog().info(text, space: space);
logUi(String text, {int space = 0}) => FileLog().info(text, space: space);
