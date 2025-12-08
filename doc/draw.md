# 绘图模块 (Draw)

绘图模块提供了丰富的图形绘制功能，包括颜色处理、路径操作、线条定义和自定义边框形状等，为 Flutter 应用开发提供了强大的绘图能力。

## 目录结构

```
draw/
├── color_extra.dart   # 颜色扩展功能
├── draw_view.dart     # 绘图视图组件
├── gradient.dart      # 渐变效果实现
├── line.dart          # 线条定义和操作
├── path_extra.dart    # 路径扩展功能
├── path_view.dart     # 路径视图组件
├── resource.dart      # 绘图资源管理
└── shape_border.dart  # 自定义边框形状
```

## 概述

绘图模块是一个功能丰富的图形绘制工具集，提供了从基础颜色处理到复杂路径操作的完整解决方案。该模块主要包含以下核心功能：

1. **颜色处理**：提供了颜色扩展方法，支持颜色转换、生成、分割等操作
2. **路径操作**：封装了路径的创建、修改和组合等功能
3. **线条定义**：提供了线条的定义和操作方法
4. **自定义边框**：实现了多种自定义边框形状，如对话框、标签、票据等

## 核心功能

### 1. 颜色处理 (color_extra.dart)

颜色处理模块提供了丰富的颜色操作扩展，方便在应用中进行颜色管理和变换。

#### 主要功能
- 随机颜色生成
- 颜色反色计算
- 色相、饱和度和明度调整
- 颜色分割（生成渐变色谱）

#### 常用枚举

```dart
enum ColorName {
  red,    // 红色 - 色相0度
  orange, // 橙色 - 色相30度
  yellow, // 黄色 - 色相60度
  green,  // 绿色 - 色相120度
  cyan,   // 青色 - 色相180度
  blue,   // 蓝色 - 色相240度
  purple, // 紫色 - 色相260度
  pink    // 粉色 - 色相300度
}
```

#### 常用函数

```dart
// 生成随机颜色
Color randomColor({double saturation = 0.5, double value = 0.5})
```

#### ColorExtra 扩展

```dart
extension ColorExtra on Color {
  // 获取当前颜色的相对色（HSV色轮旋转180度）
  Color get oppositeHSV;
  
  // 获取当前颜色的相对色（RGB反色）
  Color get oppositeRGB;
  
  // 获得当前颜色对应的随机色
  Color get random;
  
  // 保持明度亮度的情况下调整色彩
  Color changeHue(ColorName color, {int offset = 0});
  
  // 获得增加亮度的色彩
  Color changeColorValue({double offset = 0.3});
  
  // 获得浅色版本
  Color toLight({double offset = 0.3});
  
  // 获得深色版本
  Color toDark({double offset = 0.3});
  
  // 分割色彩（生成渐变色谱）
  List<Color> dividedColors(int number);
}
```

### 2. 路径操作 (path_extra.dart)

路径操作模块提供了对 Flutter Path 类的扩展，增强了路径的创建和操作能力。

#### 主要功能
- 路径联合和挖洞操作
- 基本形状路径创建（矩形、圆角矩形、圆形、三角形等）
- 平滑形状和锐利形状创建
- 路径偏移和变换

#### PathExtra 扩展

```dart
extension PathExtra on Path {
  // 路径联合操作
  Path union(Path other);
  
  // 路径挖洞操作
  Path hole(Path dig);
  
  // 创建矩形路径
  static Path rect(Rect rect);
  
  // 创建圆角矩形路径
  static Path rrect(Rect rect, {...});
  
  // 创建圆形路径
  static Path cycle({required Offset center, required double radius});
  
  // 创建三角形路径
  static Path triple({required Offset point1, required Offset point2, required Offset point3});
  
  // 创建直角三角形路径
  static Path angleTriple({required Offset anglePoint, required double length1, required double length2});
  
  // 创建线条路径
  static Path line(Line line);
  
  // 创建平滑形状路径
  static Path smoothShape(List<Offset> points, {double cornerRadius = 4.0});
  
  // 创建锐利形状路径
  static Path sharpShape(List<Offset> points);
}
```

#### RectExtra 扩展

```dart
extension RectExtra on Rect {
  // 获取矩形路径
  Path get path;
  
  // 获取带圆角的矩形路径
  Path pathWithCorner({...});
}
```

#### LineExtra 扩展

```dart
extension LineExtra on List<Offset> {
  // 创建线条路径
  Path linePath({double? cornerRadius});
  
  // 创建多边形路径
  Path polygonPath({double? cornerRadius});
}
```

### 3. 线条定义 (line.dart)

线条定义模块提供了线条的基本定义和操作方法。

#### Line 类

```dart
class Line {
  // 构成多段线的坐标点列表
  final List<Offset> points;
  
  // 控制路径的平滑程度
  final double smoothLevel;
  
  Line({required this.points, this.smoothLevel = 1});
}
```

#### StraightLine 类

```dart
class StraightLine {
  // 直线起点坐标
  final Offset point1;
  
  // 直线终点坐标
  final Offset point2;
  
  StraightLine(this.point1, this.point2);
  
  // 获取比例位置点
  Offset positionInRate(double rate);
  
  // 获取绝对偏移位置点
  Offset positionOfOffset(double offset);
}
```

### 4. 自定义边框形状 (shape_border.dart)

自定义边框形状模块提供了多种精美的边框样式，可以应用于容器、卡片等组件。

#### 主要边框类型

1. **ChatPopBorder**：对话框气泡边框（带箭头）
2. **TagBorder**：标签边框（左侧带半圆形切口）
3. **TicketBorder**：电影票边框（两侧带半圆形切口）
4. **FullReceiptBorder**：完整票据边框（上下带锯齿）
5. **TopReceiptBorder**：顶部票据边框（上带锯齿）
6. **BottomReceiptBorder**：底部票据边框（下带锯齿）

#### 示例：对话框边框

```dart
class ChatPopBorder extends ShapeBorder {
  // 箭头水平偏移比例（0.0~1.0）
  final double offset;
  
  // 箭头尺寸（宽/高）
  final Size arrowSize;
  
  // 箭头绝对定位位置（可覆盖offset参数）
  final double? position;
  
  ChatPopBorder({
    this.offset = 0.8,
    this.arrowSize = const Size(10, 10),
    this.position,
  });
  
  // 实现 ShapeBorder 接口方法
  // ...
}
```

## 使用示例

### 颜色处理示例

```dart
// 生成随机颜色
Color randomColor = randomColor(saturation: 0.8, value: 0.8);

// 获取颜色的反色
Color oppositeColor = randomColor.oppositeHSV;

// 调整颜色明度
Color lightColor = randomColor.toLight(offset: 0.2);
Color darkColor = randomColor.toDark(offset: 0.2);

// 分割颜色生成渐变色谱
List<Color> gradientColors = randomColor.dividedColors(5);
```

### 路径操作示例

```dart
// 创建矩形路径
Rect rect = Rect.fromLTWH(0, 0, 100, 100);
Path rectPath = PathExtra.rect(rect);

// 创建圆角矩形路径
Path roundedRectPath = PathExtra.rrect(
  rect,
  allCorners: 10,
);

// 创建圆形路径
Path circlePath = PathExtra.cycle(
  center: Offset(50, 50),
  radius: 50,
);

// 路径挖洞操作
Path holePath = rectPath.hole(circlePath);
```

### 自定义边框示例

```dart
// 使用对话框边框
Container(
  padding: EdgeInsets.all(10),
  decoration: ShapeDecoration(
    color: Colors.blue,
    shape: ChatPopBorder(
      offset: 0.8, // 箭头位置偏移比例
      arrowSize: Size(12, 12), // 箭头尺寸
    ),
  ),
  child: Text(
    'Hello, World!',
    style: TextStyle(color: Colors.white),
  ),
);

// 使用电影票边框
Container(
  width: 300,
  height: 150,
  decoration: ShapeDecoration(
    color: Colors.white,
    shape: TicketBorder(cutSize: 8),
    shadows: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Center(child: Text('Movie Ticket')),
);
```

## 注意事项

1. 所有绘图操作都应该在 CustomPaint 组件的 CustomPainter 中使用
2. 路径操作可能会影响性能，对于复杂路径应考虑优化
3. 自定义边框可以与 ShapeDecoration 结合使用，实现精美的UI效果
4. 颜色处理函数返回的是新的 Color 对象，不会修改原对象

## 依赖

- Flutter 基础库（dart:ui, package:flutter/material.dart）
- 结构模块（../structure/list_extra.dart, ../structure/number_extra.dart）