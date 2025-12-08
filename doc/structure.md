# 数据结构模块 (Structure)

数据结构模块提供了对各种数据类型的扩展功能，包括列表、映射、数字、字符串、时间、令牌等，旨在简化日常数据操作。

## 目录结构

```
structure/
├── list_extra.dart     # 列表相关扩展功能
├── map_extra.dart      # 映射相关扩展功能
├── number_extra.dart   # 数字相关扩展功能
├── string_extra.dart   # 字符串相关扩展功能
├── time.dart           # 时间相关扩展功能
├── token.dart          # JWT 令牌处理功能
└── value.dart          # 通用值处理函数
```

## 概述

数据结构模块是一个工具类集合，主要提供以下功能：

1. **数据类型扩展**：为 Dart 内置数据类型（List、Map、num、String、DateTime）提供额外的便捷方法
2. **通用工具函数**：提供空值检查、长度计算等通用功能
3. **令牌处理**：封装 JWT 令牌的创建、验证等功能
4. **数据操作增强**：提供列表混合、随机元素获取、字符串分割等增强功能

## 主要功能

### 1. 列表扩展 (list_extra.dart)

提供对 List 和 MapEntry 类的扩展功能，包括：
- MapEntry 比较功能
- 列表混合插入（与另一个列表或单个元素）
- 随机元素获取
- 列表比较（支持自定义比较函数）
- 子列表查找
- 索引序列生成

### 2. 映射扩展 (map_extra.dart)

提供对 Map 类的扩展功能，包括：
- 根据值查找键值对
- 根据键或值条件查找键值对

### 3. 数字扩展 (number_extra.dart)

提供对 num 和 int 类的扩展功能，包括：
- 数值范围限制
- 数字位数格式化（自动补零）

### 4. 字符串扩展 (string_extra.dart)

提供对 String 类的扩展功能，包括：
- 字符串分割（正向和反向）
- 文件存在检查
- 子字符串移除运算符
- 正则表达式匹配
- 字符串修剪
- 字符串合并
- 调试打印

### 5. 时间扩展 (time.dart)

提供对 DateTime 和 String 类的扩展功能，包括：
- 日期时间格式化（多种格式）
- 简化时间显示（根据日期差异）
- 字符串到 DateTime 的转换

### 6. 令牌处理 (token.dart)

提供 JWT 令牌的处理功能，包括：
- 令牌验证
- 令牌验证与声明检查
- 令牌构建

### 7. 通用值处理 (value.dart)

提供通用的值处理函数和类型定义，包括：
- 空值检查
- 非空检查
- 长度计算
- 检查和比较函数类型定义

## API 参考

### 1. 列表扩展 (list_extra.dart)

#### MapEntryExtra
```dart
extension MapEntryExtra<K, V> on MapEntry<K, V> {
  bool equalTo(MapEntry<K, V> other);
}
```

#### MapEntryListExtra
```dart
extension MapEntryListExtra<K, V> on List<MapEntry<K, V>> {
  bool equalTo(List<MapEntry<K, V>> other);
}
```

#### ListExtra
```dart
extension ListExtra<T> on List<T> {
  List<T> mixList(List<T> next);
  List<T> mixItem(T item, {bool around = false});
  T? get randomItem;
  bool isEqualTo(List<T> other, {bool Function(T, T)? compare});
  bool startWith(List<T> other, {bool Function(T, T)? compare});
  bool endWith(List<T> other, {bool Function(T, T)? compare});
  Iterable<MapEntry<int, T>> get indicate;
  int? find(List<T> a);
  int? findLast(List<T> a);
  bool compare<V>(Iterable<V> list, {Compare? c});
}
```

#### inc
```dart
List<int> inc({int start = 0, required int length});
```

### 2. 映射扩展 (map_extra.dart)

#### MapExtra
```dart
extension MapExtra on Map {
  MapEntry<Key, Value?>? findByValue<Key, Value>(bool byValue(Value? _));
  MapEntry<K, V>? find<K, V>({Check<K>? key, Check<V>? value});
}
```

### 3. 数字扩展 (number_extra.dart)

#### NumberExtra
```dart
extension NumberExtra on num {
  num limitBetween(num? min, num? max);
}
```

#### IntExtra
```dart
extension IntExtra on int {
  String digitsString({int digitNumber = 2});
}
```

### 4. 字符串扩展 (string_extra.dart)

#### StringExtra
```dart
extension StringExtra on String {
  (String?, String?) apartBy(String gap);
  (String?, String?) apartReverseBy(String gap);
  bool get fileExists;
}
```

#### CStr
```dart
extension CStr on String {
  String operator -(String src);
  bool isMatch(String regexp);
  Iterable<RegExpMatch> allMatchs(String regexp);
  RegExpMatch? firstMatch(String regexp);
  (String?, String?) splitLeft(String gap);
  (String?, String?) splitRight(String gap);
  String trimStringLeft(String trim);
  String trimStringRight(String trim);
  String combine(String gap, String tail);
  String print();
}
```

### 5. 时间扩展 (time.dart)

#### DateTimeExtra
```dart
extension DateTimeExtra on DateTime {
  String get dateTimeString;  // 格式: yyyy-MM-dd HH:mm:ss
  String get dateString;      // 格式: yyyy-MM-dd
  String get timeString;      // 格式: HH:mm:ss
  String get simpleString;    // 根据日期差异显示不同格式
}
```

#### DateTimeString
```dart
extension DateTimeString on String {
  DateTime get dateTime;
}
```

### 6. 令牌处理 (token.dart)

#### CToken
```dart
class CToken {
  CToken(String key);
  Future<bool> verify(String jwt);
  Future<bool> verifyMore(String jwt, {String? user, String? clientId});
  String buildJWT(CTokenBody body);
}
```

#### CTokenBody
```dart
class CTokenBody {
  String? user;
  int? expSeconds;
  String? subject;
  String? client;
}
```

### 7. 通用值处理 (value.dart)

```dart
bool isEmpty(dynamic l);
bool isNotEmpty(dynamic l);
int len(dynamic v);
typedef Check<KV> = bool Function(KV);
typedef Compare<V> = bool Function(V, V);
```

## 使用示例

### 1. 列表扩展使用

```dart
// 列表混合
List<int> list1 = [1, 2, 3];
List<int> list2 = [4, 5, 6];
List<int> mixed = list1.mixList(list2);  // 结果: [1, 4, 2, 5, 3, 6]

// 元素混合
List<int> mixedItem = list1.mixItem(0);   // 结果: [1, 0, 2, 0, 3]
List<int> mixedItemAround = list1.mixItem(0, around: true);  // 结果: [0, 1, 0, 2, 0, 3, 0]

// 随机元素
int? random = list1.randomItem;

// 列表比较
bool equal = list1.isEqualTo([1, 2, 3]);

// 子列表查找
int? index = list1.find([2, 3]);  // 结果: 1
```

### 2. 映射扩展使用

```dart
Map<String, int> map = {'a': 1, 'b': 2, 'c': 3};

// 根据值查找
MapEntry<String, int>? entry = map.findByValue((value) => value == 2);
print(entry?.key);  // 结果: b

// 根据条件查找
MapEntry<String, int>? found = map.find(key: (k) => k == 'a');
print(found?.value);  // 结果: 1
```

### 3. 数字扩展使用

```dart
// 范围限制
num limited = 15.limitBetween(0, 10);  // 结果: 10

// 位数格式化
String formatted = 5.digitsString();        // 结果: 05
String formatted4 = 5.digitsString(digitNumber: 4);  // 结果: 0005
```

### 4. 字符串扩展使用

```dart
// 字符串分割
var (first, last) = "hello-world".apartBy("-");  // first: hello, last: world

// 字符串移除
String removed = "hello world" - " ";  // 结果: helloworld

// 正则匹配
bool match = "test123".isMatch(r"^[a-z0-9]+\$");  // 结果: true

// 字符串合并
String combined = "hello-" + ".world".trimStringLeft(".");  // 结果: hello-world
String combined2 = "hello-" + ".world" - ".";  // 结果: hello-world
String combined3 = "hello-".combine("-", "-world");  // 结果: hello-world
```

### 5. 时间扩展使用

```dart
DateTime now = DateTime.now();
print(now.dateTimeString);  // 输出: 2023-06-15 14:30:45
print(now.dateString);      // 输出: 2023-06-15
print(now.timeString);      // 输出: 14:30:45
print(now.simpleString);    // 输出: 今天 14:30:45

// 字符串转时间
DateTime date = "2023-06-15T14:30:45Z".dateTime;
```

### 6. 令牌处理使用

```dart
// 创建令牌实例
CToken tokenHandler = CToken("your-secret-key");

// 构建令牌
CTokenBody body = CTokenBody()
  ..user = "user123"
  ..expSeconds = 3600
  ..subject = "auth"
  ..client = "client1";

String jwt = tokenHandler.buildJWT(body);

// 验证令牌
bool isValid = await tokenHandler.verify(jwt);
bool isValidWithClaims = await tokenHandler.verifyMore(jwt, user: "user123", clientId: "client1");
```

### 7. 通用值处理使用

```dart
// 空值检查
print(isEmpty(null));      // 结果: true
print(isEmpty([]));        // 结果: true
print(isEmpty(""));        // 结果: true
print(isEmpty({}));        // 结果: true

// 非空检查
print(isNotEmpty("hello"));  // 结果: true
print(isNotEmpty([1, 2]));   // 结果: true

// 长度计算
print(len("hello"));       // 结果: 5
print(len([1, 2, 3]));     // 结果: 3
print(len(10));            // 结果: 1
print(len(null));          // 结果: 0
```

## 依赖

令牌处理功能依赖于：
- `jose`: 用于处理 JWT 令牌

## 注意事项

1. 列表扩展中的 `compare` 方法需要注意类型匹配
2. 令牌处理功能需要正确配置密钥
3. 时间扩展中的 `simpleString` 方法基于当前日期进行比较
4. 字符串扩展中的文件操作需要适当的文件系统权限
5. 数值扩展中的 `limitBetween` 方法不修改原数值，而是返回新的限制后的值

数据结构模块为日常开发提供了丰富的工具函数，可以显著提高开发效率和代码可读性。