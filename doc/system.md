# 系统模块 (System)

系统模块提供了与系统交互的核心功能，包括文件操作、路径管理和图像处理，旨在简化应用程序与系统资源的交互。

## 目录结构

```
system/
├── file.dart                # 文件和目录操作封装
├── file_path.dart           # 应用程序路径管理
├── image_extra.dart         # 图像存储和加载功能
└── image_provider_extra.dart # ImageProvider扩展功能
```

## 概述

系统模块是一个系统资源交互工具集，主要包含三部分功能：

1. **文件操作**：封装了文件和目录的基本操作，如创建、删除、移动、复制等
2. **路径管理**：管理应用程序的各种文件路径，包括数据库、图像、临时文件等
3. **图像处理**：提供图像与存储ID之间的转换，以及图像保存功能

## 主要功能

### 1. 文件操作 (file.dart)

提供了 CFile 类，封装了文件和目录的基本操作，包括：
- 文件/目录存在检查
- 文件/目录创建
- 子文件/子目录创建
- 文件删除
- 路径获取（父目录、子文件、同级文件）
- 文件移动和复制
- 文件/目录类型检查
- 文件内容读取
- 目录内容列表

### 2. 路径管理 (file_path.dart)

提供了 FilePath 类，用于管理应用程序的各种文件路径：
- 数据库文件路径
- 图像文件路径
- 临时文件路径
- 库文件路径
- 路径初始化和设置

### 3. 图像处理 (image_extra.dart 和 image_provider_extra.dart)

提供了图像与存储ID之间的转换功能，包括：
- 根据存储ID加载图像
- 将图像保存到存储并生成ID
- StorageImage类用于管理存储图像
- ImageProvider扩展功能，支持图像保存

## API 参考

### 1. 文件操作 (file.dart)

#### CFile 类
```dart
class CFile {
  String filename;
  CFile(this.filename);
  bool get isExist;
  void createFile();
  void createPath();
  void createSubFile(String subname);
  void createSubPath(String subname);
  void remove();
  void removeSub(String subname);
  CFile get parent;
  CFile subFile(String subname);
  CFile slibing(String name);
  void moveTo(String dest);
  void copyTo(String dest);
  bool get isFile;
  bool get isDirectory;
  List<String> get lines;
  List<CFile> get files;
}
```

#### FileString 扩展
```dart
extension FileString on String {
  CFile get filePath;
}
```

### 2. 路径管理 (file_path.dart)

#### FilePath 类
```dart
class FilePath {
  static setup();
  static String get db;
  static String get tempPath;
  static String get tempNewFile;
  static String get imagePath;
  static String get imageNewFile;
  static String get libraryPath;
  static Future<String> get dbAsync;
  static Future<String> get tempPathAsync;
  static Future<String> get tempNewFileAsync;
  static Future<String> get imagePathAsync;
  static Future<String> get imageNewFileAsync;
  static Future<String> get libraryPathAsync;
}
```

### 3. 图像处理 (image_extra.dart)

#### 函数
```dart
FileImage? imageFromId(String storageId);
Future<FileImage?> imageFromIdAsync(String storageId);
String? imageToStorage(String sourcePath);
Future<String?> imageToStorageAsync(String sourcePath);
```

#### StorageImage 类
```dart
class StorageImage {
  String storageId;
  StorageImage(this.storageId);
  static StorageImage? fromPath(String sourcePath);
  FileImage? loadImage();
}
```

#### ImageExtra 扩展
```dart
extension ImageExtra on FileImage {
  String saveToStorage();
  Future<String> saveToStorageAsync();
}
```

### 4. ImageProvider 扩展 (image_provider_extra.dart)

#### ImageProviderFileExtra 扩展
```dart
extension ImageProviderFileExtra on ImageProvider {
  Future<ui.Image> _toImage();
  Image get image;
  Future saveToFile(String filePath);
  Future<String> saveToStorage({String? storageId});
}
```

## 使用示例

### 1. 文件操作使用

```dart
// 创建文件对象
CFile file = CFile('/path/to/file.txt');
CFile dir = CFile('/path/to/directory');

// 检查文件/目录是否存在
if (file.isExist) {
  print('文件存在');
}

// 创建文件
file.createFile();

// 创建目录
dir.createPath();

// 创建子文件
dir.createSubFile('subfile.txt');

// 获取父目录
CFile parent = file.parent;

// 获取子文件
CFile child = dir.subFile('child.txt');

// 移动文件
file.moveTo('/new/path/file.txt');

// 复制文件
file.copyTo('/new/path/copy.txt');

// 读取文件内容
List<String> lines = file.lines;

// 获取目录下的所有文件和目录
List<CFile> files = dir.files;

// 使用字符串扩展
CFile file2 = '/path/to/file2.txt'.filePath;
```

### 2. 路径管理使用

```dart
// 初始化路径
await FilePath.setup();

// 获取路径
String dbPath = FilePath.db;
String imagePath = FilePath.imagePath;
String tempPath = FilePath.tempPath;
String libraryPath = FilePath.libraryPath;

// 获取新文件路径
String newImageFile = FilePath.imageNewFile;
String newTempFile = FilePath.tempNewFile;

// 异步获取路径
String asyncDbPath = await FilePath.dbAsync;
String asyncImagePath = await FilePath.imagePathAsync;
String asyncNewImageFile = await FilePath.imageNewFileAsync;
```

### 3. 图像处理使用

```dart
// 从存储ID加载图像
FileImage? image = imageFromId('storage-id-123');

// 异步从存储ID加载图像
FileImage? asyncImage = await imageFromIdAsync('storage-id-123');

// 将图像保存到存储
String? storageId = imageToStorage('/path/to/image.jpg');

// 异步将图像保存到存储
String? asyncStorageId = await imageToStorageAsync('/path/to/image.jpg');

// 使用StorageImage类
StorageImage? storageImage = StorageImage.fromPath('/path/to/image.jpg');
FileImage? loadedImage = storageImage?.loadImage();

// 使用FileImage扩展
FileImage fileImage = FileImage(File('/path/to/image.jpg'));
String savedId = fileImage.saveToStorage();
String asyncSavedId = await fileImage.saveToStorageAsync();

// 使用ImageProvider扩展
NetworkImage networkImage = NetworkImage('https://example.com/image.jpg');
Image widget = networkImage.image;

// 保存图像到文件
await networkImage.saveToFile('/path/to/save/image.jpg');

// 保存图像到存储
String storageId = await networkImage.saveToStorage();
// 或指定存储ID
String customStorageId = await networkImage.saveToStorage(storageId: 'custom-id');
```

## 依赖

系统模块依赖于以下包：
- `path_provider`: 用于获取应用程序目录路径
- `uuid`: 用于生成唯一标识符

## 注意事项

1. 使用 FilePath 类前需要先调用 setup() 方法进行初始化
2. 异步方法需要使用 await 关键字
3. 文件操作可能需要适当的文件系统权限
4. 图像处理功能依赖于文件路径管理
5. 不同平台可能需要不同的权限配置
6. 测试环境下会使用 FLUTTER_TEST_HOME 环境变量作为库路径

系统模块提供了统一的接口来处理文件、路径和图像，简化了应用程序与系统资源的交互，提高了开发效率和代码可读性。