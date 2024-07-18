import 'package:sqflite/sqflite.dart';

import '../system/file_path.dart';

(String, String) _tableKV(String key, Object? value) {
  if (value is num) {
    return ('key', '$value');
  }

  return ('key', '"$value"');
}

// 数据库操作实例
class DbInterface {
  DbInterface._privateConstructor();

  static Future<DbInterface> getInstance({OnDatabaseCreateFn? onCreate}) async {
    DbInterface instance = DbInterface._privateConstructor();
    await instance._initialize(onCreate: onCreate);
    return instance;
  }

  static String keyValueTableName = "config";
  static String keyColumnName = "key";
  static String valueColumnName = "value";

  late Database _dbInst;

  _initialize({OnDatabaseCreateFn? onCreate}) async {
    // get database file path
    String dbFile = await FilePath.dbAsync;

    print("db file path: $dbFile");

    // get database instance
    _dbInst =
        await openDatabase(dbFile, version: 1, onCreate: (database, version) {
      database.execute(
          'create table $keyValueTableName ($keyColumnName text, $valueColumnName text)');
      if (onCreate != null) {
        onCreate(database, version);
      }
    });
  }

  // 销毁所有数据
  Future close() async {
    await _dbInst.close();
  }

  // 从一个table获取value
  Future<String?> value(String key) async {
    var list =
        await _dbInst.query(keyValueTableName, where: '$keyColumnName="$key"');
    if (list.isEmpty) {
      return null;
    }
    return list.first[valueColumnName] as String?;
  }

  // 往一个table写入key, value
  Future<int> setValue({required String key, required String value}) async {
    return _dbInst.rawUpdate(
        'insert or replace into $keyValueTableName ($keyColumnName, $valueColumnName) values ("$key", "$value") on conflict replace');
  }

  // 读取一行数据
  Future<Map<String, Object?>?> getOneObject(String query,
      [List<Object?>? arguments]) async {
    List<Map<String, Object?>> items = await _dbInst.rawQuery(query, arguments);

    if (items.isEmpty) {
      return null;
    }

    return items.first;
  }

  // 读取多行数据
  Future<List<Map<String, Object?>>> getObjects(String query,
      [List<Object?>? arguments]) {
    return _dbInst.rawQuery(query, arguments);
  }

  // 统计结果数量
  Future<int> countObject(String query, [List<Object?>? arguments]) async {
    List<Map<String, Object?>> items = await _dbInst.rawQuery(query, arguments);

    if (items.isEmpty) {
      return 0;
    }
    Object? count = items.first.values.first;
    if (count is int) {
      return count;
    }
    return 0;
  }

  // 执行一个sql操作
  Future execute(String sql, [List<Object?>? arguments]) async {
    await _dbInst.execute(sql, arguments);
  }

  // 添加一个数据
  Future<int> rawAddObject(String action, [List<Object?>? arguments]) {
    return _dbInst.rawInsert(action, arguments);
  }

  // 添加一个数据, 通过keyValues, 指定列名和数据的合集
  Future<int> addObject(
      {required String table, required Map<String, Object?> keyValues}) async {
    List<(String, String)> kvs =
        keyValues.entries.where((element) => element.value != null).map((e) {
      return _tableKV(e.key, e.value);
    }).toList();
    String key = kvs.map((item) => item.$1).join(',');
    String value = kvs.map((item) => item.$2).join(',');
    return rawUpdate('insert into $table ($key) values ($value)');
  }

  // 更改一个数据
  Future<int> rawUpdate(String action, [List<Object?>? arguments]) async {
    return _dbInst.rawUpdate(action, arguments);
  }

  // 更改一个数据, 通过KeyValues, 指定列名和数据的合集
  Future<int> update(
      {required String table,
      required int rawId,
      required Map<String, Object?> keyValues}) async {
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

  // 删除一个数据
  Future rawDelete(String action, [List<Object?>? arguments]) {
    return _dbInst.rawDelete(action, arguments);
  }

  // 删除一个数据, 通过rawId
  Future deleteById({required String table, required int rawId}) async {
    return rawDelete('delete $table where rawid=$rawId');
  }

  // 删除一个数据, 通过KeyValues, 指定列名和数据的合集
  Future delete(
      {required String table, required Map<String, Object?> keyValues}) async {
    String action =
        keyValues.entries.where((element) => element.value != null).map((e) {
      if (e.value is num) {
        return "${e.key}=${e.value}";
      } else {
        return '${e.key}="${e.value}"';
      }
    }).join(" and ");
    return rawDelete('delete $table where $action');
  }
}
