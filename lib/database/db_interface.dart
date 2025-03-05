import 'package:sqflite/sqflite.dart';

import '../system/file_path.dart';

(String, String) _tableKV(String key, Object? value) {
  if (value is num) {
    return (key, '$value');
  }

  return (key, '"$value"');
}

/// 数据库操作实例
class DbInterface {
  DbInterface._privateConstructor();

  /// 获取数据库操作实例
  /// 
  /// [onCreate] 数据库创建时的回调函数
  static Future<DbInterface> getInstance({OnDatabaseCreateFn? onCreate}) async {
    DbInterface instance = DbInterface._privateConstructor();
    await instance._initialize(onCreate: onCreate);
    return instance;
  }

  static String keyValueTableName = "config";
  static String keyColumnName = "key";
  static String valueColumnName = "value";

  late Database _dbInst;

  /// 初始化数据库
  /// 
  /// [onCreate] 数据库创建时的回调函数
  _initialize({OnDatabaseCreateFn? onCreate}) async {
    // get database file path
    String dbFile = await FilePath.dbAsync;

    print("db file path: $dbFile");

    // get database instance
    _dbInst =
        await openDatabase(dbFile, version: 1, onCreate: (database, version) {
      database.execute(
          'create table $keyValueTableName ($keyColumnName text NOT NULL PRIMARY KEY, $valueColumnName text)');
      if (onCreate != null) {
        onCreate(database, version);
      }
    });
  }

  /// 销毁所有数据
  Future close() async {
    await _dbInst.close();
  }

  /// 从一个表中获取值
  /// 
  /// [key] 要查询的键
  /// 
  /// 返回查询到的值，如果没有找到则返回null
  Future<String?> value(String key) async {
    var list =
        await _dbInst.query(keyValueTableName, where: '$keyColumnName="$key"');
    if (list.isEmpty) {
      return null;
    }
    return list.first[valueColumnName] as String?;
  }

  /// 往一个表中写入键值对
  /// 
  /// [key] 要插入的键
  /// [value] 要插入的值
  /// 
  /// 返回插入或替换的行数
  Future<int> setValue({required String key, required String value}) async {
    print(
        'insert or replace into $keyValueTableName ($keyColumnName, $valueColumnName) values ("$key", "$value")');
    return _dbInst.rawInsert(
        'insert or replace into $keyValueTableName ($keyColumnName, $valueColumnName) values ("$key", "$value")');
  }

  /// 读取一行数据
  /// 
  /// [query] SQL查询语句
  /// [arguments] 查询参数
  /// 
  /// 返回查询到的第一行数据，如果没有找到则返回null
  Future<Map<String, Object?>?> getOneObject(String query,
      [List<Object?>? arguments]) async {
    List<Map<String, Object?>> items = await _dbInst.rawQuery(query, arguments);

    if (items.isEmpty) {
      return null;
    }

    return items.first;
  }

  /// 读取多行数据
  /// 
  /// [query] SQL查询语句
  /// [arguments] 查询参数
  /// 
  /// 返回查询到的所有数据
  Future<List<Map<String, Object?>>> getObjects(String query,
      [List<Object?>? arguments]) {
    return _dbInst.rawQuery(query, arguments);
  }

  /// 统计结果数量
  /// 
  /// [query] SQL查询语句
  /// [arguments] 查询参数
  /// 
  /// 返回查询到的结果数量
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

  /// 执行一个SQL操作
  /// 
  /// [sql] SQL语句
  /// [arguments] 查询参数
  Future execute(String sql, [List<Object?>? arguments]) async {
    await _dbInst.execute(sql, arguments);
  }

  /// 添加一个数据
  /// 
  /// [action] SQL插入语句
  /// [arguments] 插入参数
  /// 
  /// 返回插入的行数
  Future<int> rawAddObject(String action, [List<Object?>? arguments]) {
    return _dbInst.rawInsert(action, arguments);
  }

  /// 添加一个数据, 通过keyValues, 指定列名和数据的合集
  /// 
  /// [table] 表名
  /// [keyValues] 列名和数据的映射
  /// 
  /// 返回插入的行数
  Future<int> addObject(
      {required String table, required Map<String, Object?> keyValues}) async {
    print(keyValues);
    List<(String, String)> kvs =
        keyValues.entries.where((element) => element.value != null).map((e) {
      return _tableKV(e.key, e.value);
    }).toList();
    print(kvs);
    String key = kvs.map((item) => item.$1).join(',');
    String value = kvs.map((item) => item.$2).join(',');
    return rawUpdate('insert or replace into $table ($key) values ($value)');
  }

  /// 更改一个数据
  /// 
  /// [action] SQL更新语句
  /// [arguments] 更新参数
  /// 
  /// 返回更新的行数
  Future<int> rawUpdate(String action, [List<Object?>? arguments]) async {
    return _dbInst.rawUpdate(action, arguments);
  }

  /// 更改一个数据, 通过KeyValues, 指定列名和数据的合集
  /// 
  /// [table] 表名
  /// [rowid] 行ID
  /// [keyValues] 列名和数据的映射
  /// 
  /// 返回更新的行数
  Future<int> update(
      {required String table,
      required int rowid,
      required Map<String, Object?> keyValues}) async {
    String action =
        keyValues.entries.where((element) => element.value != null).map((e) {
      if (e.value is num) {
        return "${e.key}=${e.value}";
      } else {
        return '${e.key}="${e.value}"';
      }
    }).join(",");
    print('update $table set $action where rowid=$rowid');
    return rawUpdate('update $table set $action where rowid=$rowid');
  }

  /// 删除一个数据
  /// 
  /// [action] SQL删除语句
  /// [arguments] 删除参数
  Future rawDelete(String action, [List<Object?>? arguments]) {
    return _dbInst.rawDelete(action, arguments);
  }

  /// 删除一个数据, 通过rowid
  /// 
  /// [table] 表名
  /// [rowid] 行ID
  /// 
  /// 返回删除的行数
  Future deleteById({required String table, required int rowid}) async {
    return rawDelete('delete from $table where rowid=$rowid');
  }

  /// 删除一个数据, 通过KeyValues, 指定列名和数据的合集
  /// 
  /// [table] 表名
  /// [keyValues] 列名和数据的映射
  /// 
  /// 返回删除的行数
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
    return rawDelete('delete from $table where $action');
  }
}
