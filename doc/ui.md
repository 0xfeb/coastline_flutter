# UI模块 (UI)

## 概述

UI模块是一个Flutter界面开发工具集，提供了丰富的自定义控件和扩展方法，旨在简化界面开发流程，提高代码复用性和开发效率。该模块包含了各种常用的UI组件、布局工具和交互处理功能，可以帮助开发者快速构建美观、交互友好的Flutter应用界面。

## 目录结构

UI模块所有文件均位于 `lib/ui/` 目录下，目前包含以下29个文件：

```
ui/
├── bordered_text.dart      # 带边框文本组件
├── chinese_number.dart     # 中文数字处理
├── clip.dart               # 裁剪扩展方法
├── context_extra.dart      # BuildContext扩展方法
├── control.dart            # 通用控件集合
├── delay_text.dart         # 延迟显示文本
├── glass_box.dart          # 玻璃效果容器
├── grid_list.dart          # 网格布局列表
├── help.dart               # 帮助相关组件
├── help_item.dart          # 帮助项组件
├── image_bar_with_picker.dart   # 带选择器的图像条
├── image_selector.dart     # 图像选择器
├── list_builder.dart       # 列表构建器
├── mini_control.dart       # 迷你控件集合
├── multi_image_bar_with_picker.dart  # 多图像选择器条
├── multi_tag_list.dart     # 多选标签列表
├── multi_widget.dart       # 多组件容器
├── number_field.dart       # 数字输入字段
├── pad.dart                # 间距控制
├── rich_text.dart          # 富文本组件
├── simple_button.dart      # 简化按钮创建
├── state_extra.dart        # State扩展方法
├── stroke_text.dart        # 描边文本组件
├── swtich_button.dart      # 可切换按钮
├── tag_list.dart           # 自动换行标签列表
├── tag_panel.dart          # 标签面板
├── text_display.dart       # 文本显示扩展
├── text_label_pannel.dart  # 文本标签面板
└── ui_event.dart           # UI事件处理
```

## 主要功能

UI模块提供了以下几类核心功能，其中大部分支持**逆向控件表示**这一核心设计理念：

### 逆向控件表示

UI模块的核心设计理念是**逆向控件表示**，即将传统的`Widget(value)`方式转换为更直观的`value.widget()`方式：

**传统方式：**
```dart
Text("Hello World");
Icon(Icons.home);
```

**Coastline方式：**
```dart
"Hello World".text();
Icons.home.icon();
```

这种方式更加符合自然语言表达习惯，也使得链式调用更加流畅。

### Widget扩展方法

通过`widget_extra.dart`提供了丰富的Widget扩展方法，使开发者能够以链式调用的方式快速设置组件属性和行为：

- 点击事件处理（`onTap`）
- 按压事件处理（`onPress`）
- 容器样式设置（`box`、`gradientBox`）
- 尺寸控制（`sized`、`widthBox`、`heightBox`、`gap`）
- 按钮转换（`button`）
- 旋转效果（`rotated`）
- 灵活布局（`expanded`、`sliver`）
- 透明度控制（`opacity`）
- 定位设置（`positioned`）

### 上下文扩展方法

通过`context_extra.dart`为BuildContext添加了便捷的UI操作方法：

- 对话框显示（`showAlert`）
- SnackBar提示（`showSnack`、`showSnackTitle`）

### 自定义控件

UI模块包含了多种预构建的自定义控件，可直接用于界面开发：

- **文本相关**：BorderedText（带边框文本）、StrokeText（描边文本）、DelayText（延迟文本）
- **布局组件**：GridList（网格列表）、TagList（标签列表）、MultiTagList（多选标签列表）
- **按钮控件**：SimpleButton（简化按钮）、SwitchButton（切换按钮）
- **容器组件**：GlassBox（玻璃效果容器）、TextLabelPanel（文本标签面板）
- **交互控件**：ImageSelector（图像选择器）、NumberField（数字输入字段）
- **列表工具**：ListBuilder（列表构建器）、MultiWidget（多组件容器）

### 裁剪与效果

通过`clip.dart`提供了多种裁剪方式，支持自定义裁剪区域：

- 矩形裁剪（`clipRect`）
- 圆角矩形裁剪（`clipRRect`）
- 圆形裁剪（`clipRound`）
- 路径裁剪（`clipPath`）

### 文本处理

文本相关的扩展和组件：

- TextDisplay扩展：提供多种文本样式的快捷创建方法（支持逆向表示）
- ChineseNumber：中文数字处理
- RichText：富文本组件

## API参考

### Widget扩展方法

#### `onTap`
添加点击事件：
```dart
Widget onTap(Function() onTap)
```

参数：
- `onTap`：点击回调函数

返回值：带有点击效果的InkWell组件

#### `box`
创建带边框的容器：
```dart
Container box({
  double? width,
  double? height,
  Color? color,
  EdgeInsets? padding,
  double borderSize = 1,
  Color borderColor = Colors.black,
  double? cornerRadius
})
```

参数：
- `width`：容器宽度
- `height`：容器高度
- `color`：背景颜色
- `padding`：内边距
- `borderSize`：边框粗细（默认1）
- `borderColor`：边框颜色（默认黑色）
- `cornerRadius`：圆角半径

返回值：配置完成的Container组件

#### `sized`
设置固定尺寸：
```dart
SizedBox sized({Size? size, double? height, double? width})
```

参数：
- `size`：通过Size对象设置尺寸
- `height`：直接设置高度
- `width`：直接设置宽度

返回值：固定尺寸的SizedBox组件

### 上下文扩展方法

#### `showAlert`
显示通用对话框：
```dart
Future showAlert({
  required String title,
  String subTitle = '',
  Color titleColor = Colors.black,
  Color subTitleColor = Colors.grey,
  double titleFontSize = 20,
  double subTitleFontSize = 16,
  required List<DialogAction> actions,
  bool barrierDismissible = true,
})
```

参数：
- `title`：对话框标题
- `subTitle`：对话框副标题
- `titleColor`：标题文本颜色
- `subTitleColor`：副标题文本颜色
- `titleFontSize`：标题字体大小
- `subTitleFontSize`：副标题字体大小
- `actions`：操作按钮列表
- `barrierDismissible`：点击背景是否可关闭

返回值：Future对象，可用于等待对话框关闭

#### `showSnackTitle`
显示纯文本SnackBar提示：
```dart
void showSnackTitle(String title, {Color color = Colors.grey})
```

参数：
- `title`：要显示的文本内容
- `color`：背景颜色（默认灰色）

### 文本显示扩展 (TextDisplay)

TextDisplay扩展提供了对String类的扩展，支持通过逆向表示方式创建各种样式的文本控件。

#### `text`

将字符串转换为基础Text组件：

```dart
Text text({
  Key? key,
  TextStyle? style,
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior
})
```

参数：
- `style`：文本样式（可选）
- `textAlign`：文本对齐方式（可选）
- `overflow`：文本溢出处理方式（可选）
- `maxLines`：最大行数（可选）
- 其他参数：与Flutter原生Text组件相同

返回值：配置完成的Text组件

#### `textTitle`

将字符串转换为标题样式的文本组件：

```dart
Text textTitle({
  Key? key,
  required BuildContext context,
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior
})
```

参数：
- `context`：构建上下文（必须）
- 其他参数：与text()方法相同

返回值：使用主题标题样式的Text组件

#### `textSubtitle`

将字符串转换为子标题样式的文本组件：

```dart
Text textSubtitle({
  Key? key,
  required BuildContext context,
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior
})
```

参数：
- `context`：构建上下文（必须）
- 其他参数：与text()方法相同

返回值：使用主题子标题样式的Text组件

### 自定义控件

#### TextBar
文本条控件：
```dart
TextBar(
  String text,
  {Color color = Colors.blue,
  Color textColor = Colors.white,
  double fontSize = 14,
  double radius = 4}
)
```

参数：
- `text`：需要显示的文本内容
- `color`：背景颜色（默认蓝色）
- `textColor`：文字颜色（默认白色）
- `fontSize`：文字尺寸（默认14）
- `radius`：圆角半径（默认4）

#### TagList
自动换行的标签列表组件：
```dart
TagList({
  List<String>? texts,
  int selectedTag = 0,
  double fontSize = 16,
  required Function(int) onSelectTag,
  Color selectedColor = Colors.blue,
  Color unselectedColor = Colors.grey,
  Color textColor = Colors.white
})
```

参数：
- `texts`：标签文本列表
- `selectedTag`：当前选中的标签索引（默认0）
- `fontSize`：标签文字大小（默认16）
- `onSelectTag`：标签选择回调函数
- `selectedColor`：选中状态背景色（默认蓝色）
- `unselectedColor`：未选中状态背景色（默认灰色）
- `textColor`：文字颜色（默认白色）

#### GridList
网格布局列表控件：
```dart
GridList({
  int rowNumber = 4,
  int selectedIndex = 0,
  Function(int)? onSelectIndex,
  required Widget Function(bool selected, int index, BuildContext context) itemBuilder,
  int? count,
  double spacing = 4
})
```

参数：
- `rowNumber`：每行显示的元素数量
- `selectedIndex`：当前选中项的索引
- `onSelectIndex`：选中项变更回调函数
- `itemBuilder`：子项构建器
- `count`：总项目数（可选）
- `spacing`：网格间距

### 裁剪扩展

#### `clipRRect`
圆角矩形裁剪快捷方法：
```dart
ClipRRect clipRRect({RRect Function(Size)? clip, double borderRadius = 4})
```

参数：
- `clip`：定义圆角矩形区域的函数
- `borderRadius`：圆角半径（默认4）

返回值：圆角矩形裁剪后的组件

#### `clipRound`
圆形裁剪快捷方法：
```dart
ClipOval clipRound({Rect Function(Size)? clip})
```

参数：
- `clip`：定义裁剪区域的函数

返回值：圆形裁剪后的组件

## 使用示例

### Widget扩展方法示例

```dart
// 创建一个带点击事件的蓝色容器（传统方式）
Container(
  child: Text('点击我'),
)
  .box(color: Colors.blue, cornerRadius: 8)
  .onTap(() {
    print('容器被点击了');
  });

// 创建一个带点击事件的蓝色容器（逆向表示）
Container(
  child: '点击我'.text(),
)
  .box(color: Colors.blue, cornerRadius: 8)
  .onTap(() {
    print('容器被点击了');
  });

// 创建一个渐变背景的按钮（传统方式）
Text('提交')
  .text(color: Colors.white)
  .gradientBox(
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.green],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    padding: EdgeInsets.all(12),
    cornerRadius: 8,
  )
  .onTap(() {
    // 处理提交逻辑
  });

// 创建一个渐变背景的按钮（逆向表示）
'提交'.text()
  .text(color: Colors.white)
  .gradientBox(
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.green],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    padding: EdgeInsets.all(12),
    cornerRadius: 8,
  )
  .onTap(() {
    // 处理提交逻辑
  });
```

### 对话框示例

```dart
// 在BuildContext中显示对话框
context.showAlert(
  title: '确认操作',
  subTitle: '确定要执行此操作吗？',
  actions: [
    DialogAction.cancel(
      title: '取消',
      action: () {
        print('取消操作');
      },
    ),
    DialogAction.accept(
      title: '确定',
      action: () {
        print('执行操作');
      },
    ),
  ],
);
```

### 标签列表示例

```dart
// 创建一个标签列表
TagList(
  texts: ['标签1', '标签2', '标签3', '标签4', '标签5'],
  selectedTag: _selectedTag,
  onSelectTag: (index) {
    setState(() {
      _selectedTag = index;
    });
  },
  selectedColor: Colors.blue,
  unselectedColor: Colors.grey,
);
```

### 网格列表示例

```dart
// 创建一个网格列表
GridList(
  rowNumber: 3,
  selectedIndex: _selectedIndex,
  onSelectIndex: (index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  itemBuilder: (selected, index, context) {
    return Container(
      color: selected ? Colors.blue : Colors.grey,
      child: Center(
        child: Text('项 $index'),
      ),
    );
  },
  count: 12,
  spacing: 8,
);
```

### 裁剪示例

```dart
// 裁剪成圆角矩形
Image.network('https://example.com/image.jpg')
  .clipRRect(borderRadius: 16);

// 裁剪成圆形
Image.network('https://example.com/avatar.jpg')
  .clipRound();

// 自定义路径裁剪
Container(
  width: 200,
  height: 200,
  color: Colors.red,
)
  .clipPath((size) {
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  });
```

## 依赖关系

UI模块依赖于Flutter框架的核心库，以及项目内部的一些模块：

- Flutter核心库：`material.dart`、`widgets.dart`
- 项目内部：`../structure/list_extra.dart`（用于列表扩展功能）

## 注意事项

1. **兼容性**：UI模块中的一些组件和扩展方法基于特定的Flutter版本开发，使用时请确保项目的Flutter版本与开发版本兼容。

2. **性能优化**：在使用大量自定义控件或复杂布局时，请注意性能优化，避免不必要的重建和重绘。

3. **样式一致性**：建议在项目中统一使用UI模块提供的组件和扩展方法，以保持界面样式的一致性。

4. **自定义扩展**：可以基于UI模块的扩展方法进一步自定义符合项目需求的UI组件和工具。

5. **文档更新**：随着项目的发展，UI模块可能会不断更新和扩展，请定期查看最新的文档和代码注释。

## 更新日志

暂无历史更新记录。

---

通过使用UI模块提供的组件和扩展方法，可以大大简化Flutter应用的界面开发工作，提高开发效率和代码质量。建议开发者在项目中充分利用这些工具，构建出美观、高效的用户界面。