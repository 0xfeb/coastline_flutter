# 媒体模块 (Media)

媒体模块提供了与媒体相关的功能，包括图标资源和媒体文件处理（如视频帧捕获和视频转音频）。

## 目录结构

```
media/
├── icon.dart    # 图标资源定义
└── media.dart   # 媒体文件处理功能
```

## 概述

媒体模块是一个轻量级的媒体处理工具集，主要包含两部分功能：

1. **图标资源**：提供了一组常用的图标常量，方便在应用中统一使用
2. **媒体处理**：封装了 FFmpeg 的功能，提供了视频帧捕获和视频转音频的便捷接口

## 主要功能

### 1. 图标资源 (icon.dart)

提供了一组预设的 Material Design 图标，用于统一应用中的图标风格和使用。

### 2. 媒体处理 (media.dart)

利用 FFmpeg 提供了强大的媒体处理能力，主要包括：
- 从视频中捕获特定帧并保存为图片
- 将视频文件转换为音频文件

## API 参考

### 1. 图标资源

```dart
/// 应用中常用的默认图标列表
const List<IconData> DEFAULT_ICONS = [
  Icons.account_balance_wallet,
  Icons.account_box,
  Icons.archive,
  Icons.attachment,
  Icons.battery_charging_full,
  Icons.book,
  Icons.brush,
  Icons.build,
  Icons.color_lens,
  Icons.desktop_windows,
  Icons.content_cut,
  Icons.create,
  Icons.credit_card,
  Icons.devices_other,
  Icons.dns,
  Icons.format_paint,
  Icons.headset,
  Icons.image,
  Icons.local_florist,
  Icons.pets,
  Icons.photo_camera,
  Icons.restaurant,
  Icons.security,
  Icons.style,
  Icons.straighten,
  Icons.toys,
  Icons.videogame_asset,
];
```

### 2. 媒体处理函数

#### captureVideo

```dart
Future captureVideo(
    {required String sourceFile, required String destFile}) async
```

从视频中捕获特定帧并保存为图片。

参数：
- `sourceFile`: 视频源文件路径
- `destFile`: 目标图片文件路径

返回值：
- 一个 Future 对象，表示异步操作的结果

#### videoToAudio

```dart
Future videoToAudio(
    {required String sourceFile, required String destFile}) async
```

将视频文件转换为音频文件。

参数：
- `sourceFile`: 视频源文件路径
- `destFile`: 目标音频文件路径

返回值：
- 一个 Future 对象，表示异步操作的结果

## 使用示例

### 1. 图标资源使用

```dart
// 从 DEFAULT_ICONS 中随机选择一个图标
Random random = Random();
IconData randomIcon = DEFAULT_ICONS[random.nextInt(DEFAULT_ICONS.length)];

// 在 UI 中使用
Icon(
  randomIcon,
  size: 48,
  color: Colors.blue,
);

// 遍历所有默认图标
GridView.count(
  crossAxisCount: 4,
  children: DEFAULT_ICONS.map((icon) {
    return Icon(icon, size: 32);
  }).toList(),
);
```

### 2. 媒体处理使用

```dart
// 从视频中捕获帧
String videoPath = '/path/to/video.mp4';
String imagePath = '/path/to/screenshot.jpg';

await captureVideo(sourceFile: videoPath, destFile: imagePath);
print('视频帧捕获完成：$imagePath');

// 将视频转换为音频
String audioPath = '/path/to/audio.mp3';

await videoToAudio(sourceFile: videoPath, destFile: audioPath);
print('视频转音频完成：$audioPath');
```

## 依赖

媒体处理功能依赖于 FFmpeg：
- `ffmpeg_kit_flutter_new`: 用于执行 FFmpeg 命令进行媒体处理

## 注意事项

1. 媒体处理功能需要在应用中集成 FFmpeg 库
2. 媒体处理操作可能会消耗较多资源，建议在后台线程中执行
3. 在使用前确保源文件路径正确且具有读写权限
4. 不同平台可能需要不同的 FFmpeg 配置和权限设置
5. 视频转音频功能会提取视频中的音频流，不改变音频格式