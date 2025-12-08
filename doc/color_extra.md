# 色彩扩展模块 (Color Extra)

色彩扩展模块提供了丰富的颜色操作功能，包括随机颜色生成、颜色反相、色相调整等，旨在简化应用开发中的颜色处理。

## 目录结构

```
color_extra/
└── color_extra.dart   # 颜色扩展功能
```

## 概述

色彩扩展模块是一个颜色处理工具集，主要提供以下功能：

1. **随机颜色生成**：支持生成指定饱和度和亮度的随机颜色
2. **颜色反相**：提供HSV和RGB两种反相方式
3. **色相调整**：支持基于预定义颜色名称的色相调整
4. **亮度调整**：可以增加或减少颜色的亮度

## 核心功能

### 颜色扩展 (Color类扩展)

提供了对Color类的丰富扩展方法，方便进行各种颜色操作。

## API参考

### 函数

#### `randomColor`

```dart
Color randomColor({double saturation = 0.5, double value = 0.5})
```
- 随机生成一个颜色
- `saturation`：饱和度，取值范围 0.0-1.0，默认 0.5
- `value`：亮度，取值范围 0.0-1.0，默认 0.5
- 返回值：一个随机生成的Color对象

### 扩展方法

### Color类扩展

#### `oppositeHSV`

```dart
Color get oppositeHSV
```
- 返回与当前颜色相反的颜色，保持饱和度和亮度不变
- 返回值：反相后的Color对象

#### `oppositeRGB`

```dart
Color get oppositeRGB
```
- 返回与当前颜色相反的颜色，基于RGB分量的反相
- 返回值：反相后的Color对象

#### `random`

```dart
Color get random
```
- 返回一个与当前颜色具有相同饱和度和亮度的随机颜色
- 返回值：随机颜色的Color对象

#### `changeHue`

```dart
Color changeHue(ColorName color, {int offset = 0})
```
- 更改颜色的色相，保留饱和度和亮度
- `color`：目标颜色，可以是ColorName枚举值
- `offset`：色相偏移量
- 返回值：色相调整后的Color对象

#### `changeColorValue`

```dart
Color changeColorValue({double offset = 0.3})
```
- 改变颜色的亮度，保留饱和度
- `offset`：亮度偏移，取值范围 0.0-1.0
- 返回值：亮度调整后的Color对象

#### `toLight`

```dart
Color toLight({double offset = 0.3})
```
- 将颜色变亮
- `offset`：亮度增加量，取值范围 0.0-1.0
- 返回值：变亮后的Color对象

#### `toDark`

```dart
Color toDark({double offset = 0.3})
```
- 将颜色变暗
- `offset`：亮度减少量，取值范围 0.0-1.0
- 返回值：变暗后的Color对象

#### `divide`

```dart
List<Color> divide(int count)
```
- 将当前颜色与目标颜色之间的色相范围均匀分割
- `count`：分割数量
- 返回值：包含分割后所有颜色的列表

## 依赖关系

- Flutter核心库

## 注意事项

1. 使用`changeHue`方法时，参数`color`可以是`ColorName`枚举值，也可以是自定义的颜色
2. 亮度偏移量`offset`的取值范围为0.0-1.0，超出范围可能导致不可预期的结果
3. `divide`方法用于生成渐变色谱，分割数量越多，渐变效果越平滑

## 更新日志

暂无历史更新记录。