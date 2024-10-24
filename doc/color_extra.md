# 色彩扩展

## 函数
```
Color randomColor({double saturation = 0.5, double value = 0.5})
```
- 随机生成一个颜色
- saturation 饱和度，取值范围 0.0-1.0，默认 0.5。
- value 亮度，取值范围 0.0-1.0，默认 0.5。
- 返回一个随机色彩

## 扩展
### Color
```
Color get oppositeHSV
```
- 返回与当前颜色相反的颜色，饱和度和亮度不变。
<br/>

```
Color get oppositeRGB
```
- 返回与当前颜色相反的颜色，根据RGB相反。
<br/>

```
Color get random
```
- 返回一个与当前颜色相同饱和度和亮度的随机颜色
<br/>

```
Color changeHue(ColorName color, {int offset = 0})
```
- 更改一个颜色的色相，返回一个新的颜色, 保留饱和度和亮度。
- color 要更改的颜色，可以是 ColorName 枚举值。
- offset 色相偏移。
- 返回一个新的颜色。
<br/>

```
Color changeColorValue({double offset = 0.3})
```
- 改变颜色的亮度，返回一个新的颜色，保留饱和度。
- offset 亮度偏移，取值范围 0.0-1.0。
- 返回一个新的颜色。
<br/>

```
Color toLight({double offset = 0.3})
```
- 使颜色变亮，返回一个新的颜色，保留饱和度。
- offset 亮度偏移，取值范围 0.0-1.0。
- 返回一个新的颜色。
<br/>

```
Color toDark({double offset = 0.3})
```
- 使颜色变暗，返回一个新的颜色，保留饱和度。
- offset 亮度偏移，取值范围 0.0-1.0。
- 返回一个新的颜色。
<br/>


```
List<Color> dividedColors(int number)
```
- 根据当前的颜色作为主色, 分割出 number 个颜色。
- number 颜色数量。
- 返回一个颜色列表。
<br/>
