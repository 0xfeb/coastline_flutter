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


> 函数  gradient  

gradient `[函数]` 产生一个直线渐变色, `colors [List<Color>]`指定色彩列表, 用于渐变的色彩指定. `stops[List<double>: 0-1]`指定色彩位置. `direction [Direction]`指定色彩方向, 如果未指定, 则是从左到右. 


### Resource
素材

> 扩展 IconData  

icon `[函数]` 产生一个Icon元素, `color [Color]`指定Icon色彩, `size [double]`指定Icon大小, 产生一个Icon元素.  

iconWhite `[函数]` 产生一个白色的Icon元素.  

iconBlack `[函数]` 产生一个黑色的Icon元素.  

iconGray `[函数]` 产生一个灰色的Icon元素.  

iconDarkGray `[函数]` 产生一个深灰色的Icon元素.  


> 扩展 ImageProvider  

image `[属性]` 从Provider产生Image控件, 支持高宽比等比例伸缩.  

imageFill `[属性]` 从Provider产生Image控件, 支持高宽比失衡伸缩.  


### ShapeBorder
图形边框

> 类 ChatPopBorder   

聊天泡泡边框

offset `[属性]` 聊天三角的位置, 从0到1.0.  

arrowSize `[属性]` 三角形的尺寸.  

color `[属性]`  边框的色彩.  


> 类 TagBorder   

购物标签样式边框   

>  类  TicketBorder   

电影票样式边框  

> 类  FullReceiptBorder   

票据边框, 上下都带有锯齿  

> 类  TopReceiptBorder  

票据边框, 上方带有锯齿   

> 类  BottomReceiptBorder  

票据边框, 下方带有锯齿   




> 函数  chatPopBorder  

chatPopBorder `[生成]` 获得ChatPopBorder.   

> 函数 rrectBorder   

rrectBorder `[生成]`  获得圆角矩形边框.   



### PathExtra

> 函数

pathUnion `[函数]` 合并两个Path.   

pathHole `[函数]` 在Path上挖洞.   

rectPath `[函数]` 生成矩形Path.   

rrectPath  `[函数]` 生成圆角矩形Path.   

cyclePath `[函数]` 生成圆形Path.   

triplePath `[函数]` 生成三角形Path.  

angleTriplePath `[函数]` 生成直角三角形Path.   

offsetOfLine `[函数]`  在两点中根据偏移获得一个点, 偏移从0到1.0.  

positionOfLine  `[函数]`   在两点中根据差值获得一个点, 差值就是具体的像素值, 从左边开始为正数, 从右边开始为负数.   

closedPath  `[函数]`  获得一个每个角都支持贝塞尔曲线的多边形Path.   

closedSharpPath  `[函数]`   获得一个多边形Path.   


### Paint View

> 类 PaintView     
快捷绘制Path的组件   

path `[属性]` 绘图的形状   

paint `[属性]`  绘图的模式   

size  `[属性]`  绘图控件的尺寸   

child  `[属性]`  子控件    


## structure
数据结构集合


### Combo Data  
组合数据集合

> 类 Pair  

组合两个数据   


> 类 Triple  

组合三个数据   


> 类 Quad  

组合四个数据   



### List Extra   
数组扩展  


> 扩展  List<T>   

combineMix `[函数]` 将两个数组进行交叉组合, `next [List<T>]`为接下去的数组. 返回一个组合后的新数组.  

fillMix `[函数]` 将数据交叉插入数组中, `item [T]`为插入到数组中的数据, `around [bool]`指定数据是否包含到数组之外. 返回一个组合后的新数组.   

isEqualTo `[函数]` 判断本数组是否与另外一个数组相同.   

startWith `[函数]` 判断本数组是否由另外一个数组开头.   

endWith `[函数]` 判断本数组是否另外一个数组结束.   

indicate `[属性]` 产生一个带有序列号的数组.   


> 函数 inc   

产生一个序列数组, `length [int]`数组的长度, `start [int]`数组的起始数据.  


### Map Extra   
Map扩展   

> 扩展  Map  

findByValue `函数` 通过Value元素进行数据搜索, `byValue`为数据对比函数, 返回一个带有Key和Value的MapEntry数据.   



### Number Extra  
数字类型的扩展  

> 扩展 num  

between `函数` 通过`min[num]`和`max[num]`限制本数字的上下限, 返回一个新的数据. 相当于max(min(max, X), min)的结果.  


### Number Parser  
数字分析功能

> 扩展 String  

chineseNumber `属性` 通过字符串中的中文文本, 得到一个数值.   


### String Extra  
字符串扩展 

> 扩展 String  

apartBy `函数` 通过`gap[String]`分割一个字符串, 得到两个字符串.   

apartReverseBy `函数`, 等同于apartBy, 但是是通过倒序分析.   



### Value
数据判断

> 类 Value

isEmpty `函数` 判断数据`l [dynamic]`是否为空.   



## system
系统功能集合

### Image Extra  
自动存储的图片扩展   

> 扩展 FileImage  

fromStorageId `生成` 通过Storage Id得到一个File Image. Storage ID由FileImage::Save 或者FileImage::SaveSync, FileImage::copyToStorage, FileImage::copyToStorageAsync得到.  

fromStorageIdAsync `生成` 与fromStorageId相同, 不过, 这个是异步的.  

save `函数` 保存图片, 保存之后, 会得到一个Storage ID.  

saveAsync `函数` 保存图片, 与save相同, 异步.  

copyToStorage  `函数` 拷贝一个图片文件`sourcePath [String]`到Storage, 并且得到一个Storage ID.  

copyToStorageAsync `函数`, 与copyToStorage相同, 异步.  


### Path  
系统路径   

> 类 Path  
系统路径管理工具, 单例类, 通过Path().setup()初始化.  

setup `函数` 初始化功能, 从系统获得基本的文件目录.   

temp `属性` 临时目录.  

tempAsync `属性` 与temp相同, 异步.   

db `属性` 数据库文件.   

dbAsync `属性` 与db相同, 异步.   

imageFilename `函数` 通过`main[String]`得到图像文件路径.   

imageFilenameAsync `函数`, 与imageFilename相同, 异步.   



## ui
界面控件封装

### Context Extra  
上下文的扩展  

> 类  DialogAction  
对话框按钮   

title `属性` 按钮的标题   

color `属性` 按钮的色彩   

action `属性` 按钮点击后的反应   

destroy `生成`  删除按钮   

accept `生成`  确认按钮   

cancel `生成`  取消按钮   


> 扩展 BuildContext  

showAlert `函数` 显示对话框, `title [String]`为对话框标题, `subTitle [String]`为对话框副标题, `titleColor [Color]`标题文本颜色, `subTitleColor [Color]`副标题文本颜色, `titleFontSize [double]`标题文本大小, `subTitleFontSize [double]`副标题文本大小, `actions [List<DialogAction>]`按钮列表, `barrierDismissible[bool]`点击背景是否会取消对话框.  


showSnack `函数` 显示SnackBar, `color [Color]` SnackBar的背景色, `child [Widget]` SnackBar中的子控件.  


showSnackTitle `函数` 显示文本的SnackBar, `title[String]`SnackBar中的文本, `color [Color]` 背景色.   


### Control  
组合的控件  


> 类 Control  

bar `函数` 文本显示条. `text [String]` 文本内容, `color [Color]` 文本框的背景色, `fontSize [double]` 文本大小, `textColor [Color]` 文本色彩.   


textIcon `函数` 文本和图标的上下组合体. `icon [IconData]` 图标素材, `text [String]` 文本内容, `iconColor [Color]` 图标色彩, `textColor [Color]` 文本色彩, `iconSize [double]` 图标尺寸, `fontSize [double]` 文本尺寸.    


capsule `函数` 左右的药丸结构组合. `mainText [String]` 主文本内容, `subText [String]` 副文本内容, `fontSize [double]` 文本的尺寸, `mainColor [Color]` 药丸的主色彩, `subColor [Color]` 药丸的副色彩.    


frame `函数` 相框结构, 显示图片, 边框, 以及提示图标. `picture [ImageProvider]` 图片内容, `icon [IconData]` 图标内容, `iconSize [double]` 图标尺寸, `iconColor [Color]` 图标色彩, `borderColor [Color]` 边框色彩, `borderWidth [double]` 边框宽度.   


tab `函数` 色彩Tab控件. `tabs [List<Pair<String, Color>>]` 标题和色彩的列表, `selectedIndex [int]` 当前选中的Tab, `textColor [Color]` 标题色彩, `fontSize [double]` 标题文本尺寸, `onSelectTab` 点击某个Tab后, 产生的事件.   


### GridList   
方框列表控件   

> 类 GridList   

rowNumber `属性`, 横向元素数量.  

selectedIndex `属性`, 当前选中的Grid.  

onSelectIndex `属性`, 选中某个Grid之后产生的事件.  

itemBuilder `属性`, 建造一个具体Grid的内容.  



### Mini Control   
小型控件  

> 函数 gap   空隙函数   

size `[double]`, 高度和宽度.  



### NumberField   
数值输入框   

> 类 NumberField   

color `属性`, 前后元素的色彩.   

min/max `属性`, 最小和最大的数值.   

controller `属性`, 输入框控制器.   

focus `属性`, 焦点控制器.   

style `属性`, 文本属性.   



### Pad   

> 扩展  Widget  

pad `函数`, 指定一个控件的前后左右, 或者全部, 或者上下/左右.   


> 扩展  SliverWithKeepAliveWidget   

pad `函数`, 指定一个控件的前后左右, 或者全部, 或者上下/左右.   



### RichText   

> 扩展  RichText   

formList `生成`, 从TextSpan列表获取富文本控件. `list [List<TextSpan>]`文本列表, `textAlign [TextAlign]` 文本的对齐模式, `textDirection [TextDirection]` 文本的方向, `softWrap [bool]` 软换行, `overflow [TextOverflow]` 文本溢出的处理方式, `textScaleFactor [double]` 文本放大倍数, `maxLines [int]` 最大的文本行数, `locale [Locale]` 文本所属的地区设置.   



### StrokeText   

> 类  StrokeText   
绘制一个文本的空边框   

strokeCap  `属性` 绘图的转角设计.   

strokeJoin `属性` 绘图的链接模式.   

strokeWidth  `属性` 绘图的线宽度.   

strokeColor  `属性`  线的色彩.   

style  `属性` 文本形式.   

text `属性`  文本内容.   

textAlign  `属性`  文本的对齐模式.   

textDirection   `属性`  文本的方向.   

locale  `属性` 文本所属地区设置.   

softWrap  `属性` 软换行.   

overflow  `属性` 文本溢出的处理方式.   

textScaleFactor  `属性` 文本放大倍数.   

maxLines  `属性` 文本最大行数.   




### TagList  

> 类  TagList   
支持自动换行的Tag列表控件.   

texts  `属性` 文本列表.   

selectedTag  `属性` 当前选中的Tag.   

fontSize  `属性` 文本大小.   

onSelectTag  `属性`  选中某个Tag之后产生的事件.   

selectedColor   `属性`  选中的Tag元素背景色.   

unselectedColor   `属性` 未选中的Tag元素背景色.   

textColor   `属性` 文本的色彩.   



### TextDisplay   

> 扩展  String   
字符串的显示扩展功能   

text `函数`, 从字符串得到文本控件.  属性与标准的Text控件相同.  

textTitle  `函数`, 从字符串得到标题文本控件. 字符大小由上级Theme指定.   

textSubtitle  `函数`, 从字符串得到副标题文本控件.  字符大小由上级Theme指定.   

textBodyBold  `函数`, 从字符串得到宽文本控件.  字符大小由上级Theme指定.   

textBodyNormal   `函数`, 从字符串得到标准文本控件.  字符大小由上级Theme指定.    

textButton  `函数`, 从字符串得到按钮文本控件.  字符大小由上级Theme指定.    

textSpan  `函数`, 从字符串得到TextSpan控件, `style [TextStyle]`为文本显示形式,  `onTap` 为点击文本的时候, 产生的事件.   



### WidgetExtra   


> 扩展  Widget   

onTap  `函数`,  点击事件的控件.  

onPress   `函数`,  按下/释放事件的控件.   

box   `[函数]`, 生成一个Container控件.   

sized   `函数`, 设置尺寸大小的控件.   

rrect   `函数`, 圆角矩形控件.   

rotated   `函数`, 旋转控件.   

expanded  `函数`, 扩大化控件.   

sliver  `函数`, 将当前控件Sliver化.   

opacity  `函数`, 将当前控件半透明化(0为透明, 1为不透明)   

positioned  `函数`, 适配Stack的内部子控件.  

apsect  `函数`, 设定宽高比的控件.  

center / left / right / top / bottom / leftTop / rightTop / leftBottom / rightBottom `属性`, 位置设定控件.   

align  `函数` 按照比例配置的位置控件.   

