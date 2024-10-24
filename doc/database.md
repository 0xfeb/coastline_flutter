# 数据库接口

## 类 DbInterface

### 构造函数
Future<DbInterface> getInstance({OnDatabaseCreateFn? onCreate})
- onCreate 创建对象时候的回调函数, 用于初始化数据库的一些配置

### 属性
keyValueTableName 配置表的名称<br/>
keyColumnName 配置表的Key列名称<br/>
valueColumnName 配置表的Value列名称<br/>

### 方法
```
Future close()
```
- 关闭数据库连接
<br/>

```
Future<String?> value(String key)
```
- 根据Key从配置表获取Value值
<br/>

```
Future<int> setValue({required String key, required String value})
```
- 设置Key-Value值到配置表
- key 配置项的Key
- value 配置项的Value
- 返回设置的行数
<br/>

```
Future<Map<String, Object?>?> getOneObject(String query,
[List<Object?>? arguments])
```
- 读取单条数据
- query 查询语句
- arguments 查询语句参数
- 返回查询到的结果
<br/>

```
Future<List<Map<String, Object?>>> getObjects(String query,
[List<Object?>? arguments])
```
- 读取数据列表
- query 查询语句
- arguments 查询语句参数
- 返回所有查询到的结果
<br/>

```
Future execute(String sql, [List<Object?>? arguments])
```
- 执行SQL语句
- sql SQL语句
- arguments SQL语句参数
- 返回影响的行数
<br/>

```
Future<int> rawAddObject(String action, [List<Object?>? arguments])
```
- 插入数据, 执行原生SQL语句
- action SQL语句
- arguments SQL语句参数
- 返回影响的行数
<br/>

```
Future<int> addObject(
{required String table, required Map<String, Object?> keyValues})
```
- 插入数据
- table 表名
- keyValues 插入的数据
- 返回影响的行数
<br/>

```
Future<int> rawUpdate(String action, [List<Object?>? arguments])
```
- 更新数据, 执行原生SQL语句
- action SQL语句
- arguments SQL语句参数
- 返回影响的行数
<br/>

```
Future<int> update(
{required String table,
required int rowid,
required Map<String, Object?> keyValues})
```
- 更新数据
- table 表名
- rowid 要更新的行的ID
- keyValues 更新的数据
- 返回影响的行数
<br/>

```
Future rawDelete(String action, [List<Object?>? arguments])
```
- 删除数据, 执行原生SQL语句
- action SQL语句
- arguments SQL语句参数
- 返回影响的行数
<br/>

```
Future deleteById({required String table, required int rowid})
```
- 删除数据
- table 表名
- rowid 要删除的行的ID
- 返回影响的行数
<br/>

```
Future delete(
{required String table, required Map<String, Object?> keyValues})
```
- 删除数据
- table 表名
- keyValues 删除条件
- 返回影响的行数
<br/>

