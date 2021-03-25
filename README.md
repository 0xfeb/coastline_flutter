# Coatline代码库

个人所用的Flutter简化使用库

# 模块设计

## draw
绘图功能集合

### Color Extra
色彩扩展  

> 枚举  ColorName  

red -- 红色   
orange -- 橙色  
yellow -- 黄色  
green -- 绿色  
cyan -- 青色  
blue -- 蓝色  
puple -- 紫色  
pink -- 粉色  



> 扩展  Color  

opsiteHSV / opsiteRGB  `[属性]` 相对于当前色彩的反向色彩, 获得一个新的色彩  

changeHue `[函数]` 在保持亮度和明度的情况下, 修改色彩, 指定一个基本色彩`color[ColorName]`以及色彩偏移`offset[int:0-360]`, 获得一个新的色彩  

bright `[函数]` 增加或者减少亮度`offset[int]`, 正数为增加, 负数为减少, 最低不能低于0, 最高不能高于1, 获得一个新的色彩  

dark `[函数]` 与bright相反的功能, 获得一个新的色彩  

devidedColors `[函数]` 跟当前颜色明度亮度相同的情况下, 产生一批不同色彩的颜色, 获得一个颜色列表  


### Gradient
渐变元素

> 枚举  Direction  

方向指定  
toDown  朝向下方  
toUp  朝向上方  
toRight 朝向右方  
toLeft 朝向左方  
toTopLeft 朝向左上  
toTopRight 朝向右上  
toBottomLeft 朝向左下  
toBottomRight 朝向右下  


> 扩展  LinearGradient  

fromList `[生成]` 产生一个直线渐变色, `colors [List<Color>]`指定色彩列表, 用于渐变的色彩指定. `stops[List<double>: 0-1]`指定色彩位置. `direction [Direction]`指定色彩方向, 如果未指定, 则是从左到右. 


### Resource
素材

> 扩展 IconData  

icon `[函数]` 产生一个Icon元素, `color [Color]`指定Icon色彩, `size [double]`指定Icon大小, 产生一个Icon元素.  

iconWhite `[函数]` 产生一个白色的Icon元素.  

iconBlack `[函数]` 产生一个黑色的Icon元素.  

iconGrey `[函数]` 产生一个灰色的Icon元素.  

iconDarkGrey `[函数]` 产生一个深灰色的Icon元素.  


> 扩展 ImageProvider  

image `[属性]` 从Provider产生Image控件.  


### ShapeBorder
图形边框

> 类 ChatPopBorder   

聊天泡泡边框

offset `[属性]` 聊天三角的位置, 从0到1.0.  

arrowSize `[属性]` 三角形的尺寸.  

color `[属性]`  边框的色彩.  


> 扩展  ShapeBorder  

chatPop `[生成]` 获得ChatPopBorder.   

rrect `[生成]`  获得圆角矩形边框.   




## structure
数据结构集合

## system
系统功能集合

## ui
界面控件封装
