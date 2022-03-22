import 'package:sqflite/sqflite.dart';
import '../structure/combo_data.dart';
import '../system/file_path.dart';

Pair<String, String> _tableKV(String key, Object? value) {
  if (value is num) {
    return Pair('key', '$value');
  }

  return Pair('key', '"$value"');
}

class DbInterface {
  static OnDatabaseCreateFn? onCreate;
  static final DbInterface _instance = DbInterface._internal();
  factory DbInterface() {
    return _instance;
  }
  DbInterface._internal() {
    setup();
  }

  late String _dbFile;
  late Database _dbInst;

  setup() async {
    // get database file path
    _dbFile = FilePath().db!;

    // get database instance
    _dbInst =
        await openDatabase(_dbFile, version: 1, onCreate: DbInterface.onCreate);
  }

  Future<String?> value(
      {required String key,
      required String table,
      String columnKey = "key",
      String columnValue = "value"}) async {
    var list = await _dbInst.query(table, where: '$columnKey="$key"');
    if (list.isEmpty) {
      return null;
    }
    return list.first[columnValue] as String?;
  }

  Future<int> setValue(
      {required String key,
      required String value,
      required String table,
      String columnKey = "key",
      String columnValue = "value"}) async {
    return _dbInst.rawUpdate(
        'insert or replace into $table ($columnKey, $columnValue) values ("$key", "$value") on conflict replace');
  }

  Future<Map<String, Object?>?> getObject(String query) async {
    List<Map<String, Object?>> items = await _dbInst.rawQuery(query);

    if (items.isEmpty) {
      return null;
    }

    return items.first;
  }

  Future<List<Map<String, Object?>>> listObject(String query) {
    return _dbInst.rawQuery(query);
  }

  Future<int> countObject(String query) async {
    List<Map<String, Object?>> items = await _dbInst.rawQuery(query);

    if (items.isEmpty) {
      return 0;
    }
    Object? count = items.first.values.first;
    if (count is int) {
      return count;
    }
    return 0;
  }

  Future<int> rawAddObject(String action) {
    return _dbInst.rawInsert(action);
  }

  Future<int> addObject(
      {required String table, required Map<String, Object?> keyValues}) async {
    List<Pair<String, String>> kvs =
        keyValues.entries.where((element) => element.value != null).map((e) {
      return _tableKV(e.key, e.value);
    }).toList();
    String key = kvs.map((item) => item.a).join(',');
    String value = kvs.map((item) => item.b).join(',');
    return rawUpdate('insert into $table ($key) value ($value)');
  }

  Future<int> rawUpdate(String action) {
    return _dbInst.rawUpdate(action);
  }

  Future<int> update(
      {required String table,
      required int rawId,
      required Map<String, Object?> keyValues}) {
    String action =
        keyValues.entries.where((element) => element.value != null).map((e) {
      if (e.value is num) {
        return "${e.key}=${e.value}";
      } else {
        return '${e.key}="${e.value}"';
      }
    }).join(",");
    return rawUpdate('update $table set $action where rawid=$rawId');
  }
}
