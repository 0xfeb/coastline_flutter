# Coastline 代码库

一个功能丰富的 Flutter 工具库，旨在简化 Flutter 开发过程，提供常用的 UI 组件、工具函数和扩展方法。

## 项目简介

Coastline 是一个轻量级但功能强大的 Flutter 工具库，为开发者提供了一系列实用的扩展和组件，帮助开发者更快速地构建高质量的 Flutter 应用。

### 主要特性

- **逆向控件表示**：创新的控件调用方式，将 `Text("aaa")` 转换为 `"aaa".text()`，更符合自然语言表达习惯
- **丰富的 UI 组件**：提供各种常用的 UI 控件，如按钮、标签、卡片、图片选择器等
- **强大的绘图功能**：支持颜色处理、渐变、自定义边框、路径操作等
- **实用的数据结构扩展**：增强了 List、Map、String 等基础数据类型
- **系统功能封装**：简化了文件操作、图片处理、时间处理等系统功能
- **便捷的工具函数**：提供了大量实用的工具函数，提高开发效率

## 核心设计理念：逆向控件表示

Coastline 库最独特的设计理念是**逆向控件表示**。在传统 Flutter 开发中，通常是先描绘父控件，再嵌套子控件：

```dart
Text("Hello World");
Icon(Icons.home);
```

而在 Coastline 中，我们采用了更加直观和符合自然语言习惯的方式：

```dart
"Hello World".text();
Icons.home.icon();
```

这种逆向表示方式具有以下优势：

1. **更自然的语法**：符合我们日常表达的顺序（"将这段文本显示为文本控件"而不是"创建一个显示这段文本的控件"）
2. **链式调用更流畅**：可以轻松地添加各种扩展方法，构建复杂的控件结构
3. **代码可读性更高**：一目了然地看到控件的功能和属性
4. **减少嵌套层级**：避免了传统嵌套方式可能导致的"嵌套地狱"

Coastline 中的大部分 UI 控件和功能都支持这种逆向表示方式，这也是整个库的核心设计思想。

## 安装说明

在项目的 `pubspec.yaml` 文件中添加以下依赖：

```yaml
dependencies:
  coastline: ^1.0.1
```

然后运行以下命令获取依赖：

```bash
flutter pub get
```

## 快速开始

导入 Coastline 库：

```dart
import 'package:coastline/coastline.dart';
```

### 简单示例

```dart
// 使用颜色扩展
Color randomColor = Colors.blue.random;
Color lightBlue = Colors.blue.toLight(0.3);

// 使用渐变
LinearGradient gradient = gradient(colors: [Colors.red, Colors.blue], direction: Direction.toRight);

// 使用 Widget 扩展
Text('Hello Coastline')
  .textTitle()
  .pad(20)
  .onTap(() => print('Text tapped'));

// 使用图标扩展
Icons.home.icon(color: Colors.white, size: 24);

// 使用对话框
context.showAlert(
  title: '提示',
  subTitle: '这是一个 Coastline 对话框',
  actions: [
    DialogAction.accept(title: '确定'),
    DialogAction.cancel(title: '取消'),
  ],
);
```

## 核心功能模块

### 1. Animation（动画）

提供动画相关的扩展和工具，包括：
- 隐式动画组件
- 变换动画
- 动画控制器扩展

### 2. Database（数据库）

提供数据库操作的封装，简化 SQLite 数据库的使用。

### 3. Draw（绘图）

#### Color Extra
色彩扩展功能：
- 颜色名称枚举 `ColorName`
- 随机颜色生成
- 颜色反转、亮度调整、色相修改等扩展方法

#### Gradient
渐变元素：
- 方向枚举 `Direction`
- 便捷的渐变生成函数

#### Resource
素材处理：
- IconData 扩展，快速生成 Icon 控件
- ImageProvider 扩展，快速生成 Image 控件

#### ShapeBorder
自定义图形边框：
- ChatPopBorder：聊天泡泡边框
- TagBorder：标签样式边框
- TicketBorder：电影票样式边框
- ReceiptBorder：票据边框（上下、上、下锯齿）

#### Line
线条处理：
- Line 类：多段线
- StraightLine 类：直线及相关计算方法

#### PathExtra
路径操作：
- 路径合并、挖洞
- 各种形状路径生成（矩形、圆角矩形、圆形、三角形等）
- 路径平滑和尖锐化

#### Draw View
绘图控件：
- DrawView：快捷绘图板控件
- PathView：路径绘制控件

### 4. Media（媒体）

- 图标处理
- 媒体资源管理

### 5. Structure（数据结构）

#### List Extra
数组扩展：
- 数组交叉组合
- 随机元素获取
- 数组比较和搜索

#### Map Extra
Map 扩展：
- 通过值查找键

#### Number Extra
数字扩展：
- 数值范围限制
- 数字格式化

#### String Extra
字符串扩展：
- 字符串分割
- 中文数字解析

#### Value
值判断：
- 空值判断

#### Time
时间处理：
- DateTime 扩展，格式化显示
- 字符串转时间

### 6. System（系统）

#### File Path
文件路径管理：
- 系统路径获取
- 临时文件路径
- 数据库文件路径

#### Image Extra
图片处理：
- 图片存储和读取
- 图片路径管理

### 7. UI（界面）

#### Clip
控件切割：
- 矩形、圆角矩形、圆形切割
- 自定义路径切割

#### Context Extra
上下文扩展：
- 对话框显示
- SnackBar 显示

#### Control
组合控件：
- TextBar：文本条
- IconTextBar：图标文本条
- Capsule：胶囊控件
- PhotoFrame：带框图片
- ColorTab：颜色标签

#### GridList
网格列表控件：
- 可选择的网格列表

#### Image Selector
图片选择器：
- 单图片选择器
- 多图片选择器

#### Mini Control
小型控件：
- Gap：空隙控件

#### NumberField
数值输入框：
- 支持范围限制
- 支持小数输入

#### Pad
边距扩展：
- Widget 和 Sliver 的边距设置

#### RichText
富文本：
- TextSpan 列表转 RichText

#### StrokeText
描边文本：
- 文本描边效果

#### TagList
标签列表：
- 单选标签列表
- 多选标签列表
- 图标标签网格

#### Multi Widget
多控件组合：
- 快速生成 Row、Column、ListView、GridView 等
- 支持 Sliver 控件组合

#### TextDisplay
文本显示扩展：
- 文本样式扩展（标题、副标题、正文等）

#### WidgetExtra
Widget 扩展：
- 点击事件、尺寸设置、旋转、透明度等
- 位置调整、约束设置、动画效果等

#### Help
帮助功能：
- 帮助页面显示

## 命名规范

- 类名：使用大驼峰命名法（PascalCase）
- 函数名：使用小驼峰命名法（camelCase）

## 文档资源

### API文档

可以通过以下链接直接访问完整的API文档：

[Coastline API文档入口](./api/index.html)

### 模块文档

以下是各功能模块的详细文档：

- [动画模块（Animation）](./doc/animation.md)
- [色彩扩展模块（Color Extra）](./doc/color_extra.md)
- [数据库模块（Database）](./doc/database.md)
- [绘图模块（Draw）](./doc/draw.md)
- [媒体模块（Media）](./doc/media.md)
- [数据结构模块（Structure）](./doc/structure.md)
- [系统模块（System）](./doc/system.md)
- [UI模块（UI）](./doc/ui.md)

## 贡献指南

欢迎提交 Issue 和 Pull Request！

### 提交代码

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交 Pull Request

## 许可证

本项目采用 MIT 许可证，详情请查看 [LICENSE](LICENSE) 文件。

## 联系方式

- GitHub: [https://github.com/0xfeb/coastline_flutter](https://github.com/0xfeb/coastline_flutter)

## 更新日志

请查看 [CHANGELOG.md](CHANGELOG.md) 文件获取更新历史。