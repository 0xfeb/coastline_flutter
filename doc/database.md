# 数据库模块 (Database)

数据库模块提供了对 SQLite 数据库的封装，简化了 Flutter 应用中的数据持久化操作。

## 目录结构

```
database/
└── db_interface.dart   # 数据库操作接口封装
```

## 概述

`DbInterface` 类是数据库模块的核心，提供了一套简洁易用的 API，用于处理 SQLite 数据库的创建、查询、插入、更新和删除等操作。该类采用单例模式设计，确保应用中只有一个数据库连接实例。

## 主要功能

### 数据库初始化
- 自动创建数据库文件
- 提供自定义表创建的回调函数
- 支持版本管理

### 基本操作
- 键值对存储和查询
- 原始 SQL 语句执行
- 数据统计

### 高级操作
- 基于字典的插入和更新
- 基于 ID 或条件的删除
- 批量操作支持

## API 参考

### DbInterface 类

数据库操作的核心类，提供了所有数据库相关的功能。

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
Future<String?> getValue(String key)
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
Future<Map<String, Object?>?> queryOneLine(String query,
[List<Object?>? arguments])
```
- 读取单条数据
- query 查询语句
- arguments 查询语句参数
- 返回查询到的结果
<br/>

```
Future<List<Map<String, Object?>>> queryLines(String query,
[List<Object?>? arguments])
```
- 读取数据列表
- query 查询语句
- arguments 查询语句参数
- 返回所有查询到的结果
<br/>

```
Future<int> countObject(String query, [List<Object?>? arguments])
```
- 统计结果数量
- query 查询语句
- arguments 查询语句参数
- 返回查询到的结果数量
<br/>

```
Future execute(String sql, [List<Object?>? arguments])
```
- 执行SQL语句
- sql SQL语句
- arguments SQL语句参数
<br/>

```
Future<int> insertLine(String action, [List<Object?>? arguments])
```
- 插入数据, 执行原生SQL语句
- action SQL语句
- arguments SQL语句参数
- 返回影响的行数
<br/>

```
Future<int> insertDict(
{required String table, required Map<String, Object?> keyValues})
```
- 插入数据
- table 表名
- keyValues 插入的数据
- 返回影响的行数
<br/>

```
Future<int> updateLine(String action, [List<Object?>? arguments])
```
- 更新数据, 执行原生SQL语句
- action SQL语句
- arguments SQL语句参数
- 返回影响的行数
<br/>

```
Future<int> updateDict(
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
Future<int> deleteLine(String action, [List<Object?>? arguments])
```
- 删除数据, 执行原生SQL语句
- action SQL语句
- arguments SQL语句参数
- 返回影响的行数
<br/>

```
Future<int> deleteById({required String table, required int rowid})
```
- 删除数据
- table 表名
- rowid 要删除的行的ID
- 返回影响的行数
<br/>

```
Future<int> deleteByDict(
{required String table, required Map<String, Object?> keyValues})
```
- 删除数据
- table 表名
- keyValues 删除条件
- 返回影响的行数
<br/>

