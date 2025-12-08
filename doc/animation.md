# Animation 模块

动画模块提供了一系列用于简化 Flutter 动画开发的工具和扩展方法，包括动画控制器封装、隐式动画扩展和控件变形功能。

## 文件结构

```
animation/
├── ac_ext.dart         # 动画控制器扩展和封装
├── implicitly_animate.dart  # 隐式动画扩展
└── transform.dart      # 控件变形扩展
```

## 主要功能

### 1. 动画控制器扩展 (ac_ext.dart)

提供了 `AnimationController` 的扩展方法和封装类，简化动画的创建和管理。

#### ACExt 扩展

为 `AnimationController` 提供的扩展方法：

```dart
extension ACExt on AnimationController {
  // 创建一个动画对象
  Animation<V> animation<V>(V startValue, V endValue, Curve curve, {Curve? reverseCurve});
}
```

**参数说明：**
- `startValue`: 动画开始值
- `endValue`: 动画结束值
- `curve`: 动画曲线
- `reverseCurve`: 反向动画曲线（可选）

**使用示例：**

```dart
_animationController = AnimationController(vsync: this);
_animation = _animationController.animation(0, 100, Curves.easeInOut);

// 在 AnimatedBuilder 中使用
AnimatedBuilder(
  animation: _animation,
  builder: (context, child) {
    return Container(
      width: _animation.value,
      height: _animation.value,
      color: Colors.red,
    );
  },
);

// 播放动画
_animationController.forward();
```

#### CLAnimationController 类

封装的动画控制器类，简化了动画的创建和使用：

```dart
class CLAnimationController {
  // 构造函数
  CLAnimationController({required TickerProvider vsync, Duration duration = const Duration(milliseconds: 300)});
  
  // 释放资源
  dispose();
  
  // 构建动画Widget
  Widget build<T>({
    required T startValue,
    required T endValue,
    required TransitionBuilder builder,
    Widget? child
  });
}
```

**使用示例：**

```dart
_animationController = CLAnimationController(vsync: this);

_animationController.build(
  startValue: 0,
  endValue: 100,
  child: Text('Hello World'),
  builder: (context, child) {
    return Container(
      width: animation.value,
      height: animation.value,
      color: Colors.red,
      child: child,
    );
  },
);

_animationController.forward();
```

### 2. 隐式动画扩展 (implicitly_animate.dart)

为各种 Widget 提供隐式动画扩展，使控件能够自动响应属性变化并产生动画效果。

#### 主要扩展方法

| 扩展名称 | 说明 | 使用方法 |
|---------|------|---------|
| `animatedAlign` | 为 Align 组件添加隐式动画 | `widget.animatedAlign(animateValueForAlignment: Alignment.center)` |
| `animatedContainer` | 为 Container 组件添加隐式动画 | `widget.animatedContainer(width: 100, height: 100)` |
| `animatedDefaultTextStyle` | 为 DefaultTextStyle 组件添加隐式动画 | `widget.animatedDefaultTextStyle(textStyle: TextStyle(fontSize: 20))` |
| `animatedOpacity` | 为 Opacity 组件添加隐式动画 | `widget.animatedOpacity(opacity: 0.5)` |
| `animatedPadding` | 为 Padding 组件添加隐式动画 | `widget.animatedPadding(padding: EdgeInsets.all(20))` |
| `animatedPosition` | 为 Positioned 组件添加隐式动画 | `widget.animatedPosition(left: 10, top: 10)` |

**通用参数：**
- `curve`: 动画曲线（默认：`Curves.linear`）
- `duration`: 动画持续时间（默认：300毫秒）
- `onEnd`: 动画结束时的回调函数（可选）

**使用示例：**

```dart
Container(
  color: Colors.red,
  child: Text('Animated Container'),
).animatedContainer(
  width: _isExpanded ? 200 : 100,
  height: _isExpanded ? 200 : 100,
  curve: Curves.easeInOut,
  duration: Duration(seconds: 1),
);
```

### 3. 控件变形扩展 (transform.dart)

提供了各种矩阵变换的快捷实现方式，适用于需要临时调整控件位置/角度/尺寸的场景。

```dart
extension TransformExt on Widget {
  Widget move({double x = 0, double y = 0});           // 平移
  Widget scale({double x = 1, double y = 1, Alignment basePoint = Alignment.center});  // 缩放
  Widget rotate({double angle = 0, Alignment basePoint = Alignment.center});  // 旋转
  Widget flip({bool horizontal = false, bool vertical = false});  // 镜像翻转
  Widget skew({double horizontal = 0, double vertical = 0, Alignment basePoint = Alignment.center});  // 斜切
  Widget rotateX({double angle = 0, Alignment basePoint = Alignment.center});  // 三维X轴旋转
  Widget rotateY({double angle = 0, Alignment basePoint = Alignment.center});  // 三维Y轴旋转
}
```

**使用示例：**

```dart
// 组合使用多个变换
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Text('Transformed'),
)
  .rotate(angle: 45)  // 旋转45度
  .scale(x: 1.5, y: 1.5)  // 放大1.5倍
  .move(x: 50, y: 50);  // 平移
```

## 总结

Animation 模块提供了丰富的动画工具，可以帮助开发者快速实现各种动画效果：

- 使用 `CLAnimationController` 和 `ACExt` 简化动画控制器的使用
- 利用隐式动画扩展快速为控件添加动画效果
- 通过变形扩展轻松实现控件的平移、缩放、旋转等效果

这些工具大大降低了 Flutter 动画开发的复杂度，提高了开发效率。