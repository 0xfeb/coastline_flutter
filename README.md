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


> 函数 randomColor   
生成随机颜色   


> 扩展  Color  

opsiteHSV / opsiteRGB  `[属性]` 相对于当前色彩的反向色彩, 获得一个新的色彩  

random `[属性]` 根据当前颜色的特性, 获得一个随机颜色  

changeHue `[函数]` 在保持亮度和明度的情况下, 修改色彩, 指定一个基本色彩`color[ColorName]`以及色彩偏移`offset[int:0-360]`, 获得一个新的色彩  

changeColorValue `[函数]` 增加或者减少亮度`offset[int]`, 正数为增加, 负数为减少, 最低不能低于0, 最高不能高于1, 获得一个新的色彩  

toLight / toDark `[函数]` 调整亮度  

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
图形边框, 适用于ShapeDecoration中, 为Container的Decoration去配置.

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


### Line

> 类 Line 多段线

points `[属性]` 点列表  

smoothLevel `[属性]` 平滑等级, 暂时无作用

> 类 StraightLine 直线

point1 `[属性]` 点1

point2 `[属性]` 点2

positionInRate `[函数]` 从0到1的线中心取点

positionOfOffset `[函数]` 线偏移取点, >0, 从Point1这边偏移, <0, 从Point2这边偏移


### PathExtra

> 函数

PathExtra::union `[函数]` 合并两个Path.   

PathExtra::hole `[函数]` 在Path上挖洞.   

PathExtra::rect `[函数]` 生成矩形Path.   

PathExtra::rrect  `[函数]` 生成圆角矩形Path.   

PathExtra::cycle `[函数]` 生成圆形Path.   

PathExtra::triple `[函数]` 生成三角形Path.  

PathExtra::angleTriple `[函数]` 生成直角三角形Path.   

PathExtra::line `[函数]`  绘制一条线.  

PathExtra::smoothShape  `[函数]`   平滑的图形.   

PathExtra::sharpShape  `[函数]`  尖锐的图形.   

> 扩展 RectExtra

path `[函数]` 直角的Rect的Path.  

pathWithCorner `[函数]` 带圆角的Rect的Path.  

> 扩展 LineExtra, 基于List<Offset>.  

linPath `[函数]` 绘制线条的Path.  

polygonPath `[函数]` 绘制图形的path.  


### Draw View

> 类 DrawView     
快捷绘图板控件   

onPaint `[属性]` 绘图函数   

size  `[属性]`  绘图控件的尺寸   

child  `[属性]`  子控件    


### Path View

> 类 PathView  

path `[属性]` 绘图路径  

paint `[属性]` 绘图模式  

child `[属性]` 子控件  


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

mixList `[函数]` 将两个数组进行交叉组合, `next [List<T>]`为接下去的数组. 返回一个组合后的新数组.  

mixItem `[函数]` 将数据交叉插入数组中, `item [T]`为插入到数组中的数据, `around [bool]`指定数据是否包含到数组之外. 返回一个组合后的新数组.   

randomItem `[属性]` 从list获取一个随机对象.   

isEqualTo `[函数]` 判断本数组是否与另外一个数组相同.   

startWith `[函数]` 判断本数组是否由另外一个数组开头.   

endWith `[函数]` 判断本数组是否另外一个数组结束.   

indicate `[属性]` 产生一个带有序列号的数组.   

find / findLast `[函数]` 搜索一个子list.  


> 函数 inc   

产生一个序列数组, `length [int]`数组的长度, `start [int]`数组的起始数据.  


### Map Extra   
Map扩展   

> 扩展  Map  

findByValue `函数` 通过Value元素进行数据搜索, `byValue`为数据对比函数, 返回一个带有Key和Value的MapEntry数据.   



### Number Extra  
数字类型的扩展  

> 扩展 num  

limitBetween `函数` 通过`min[num]`和`max[num]`限制本数字的上下限, 返回一个新的数据. 相当于max(min(max, X), min)的结果.  

> 扩展 int

digitsString `[函数]` 设定0的数量, 如果数字不够位数, 在前方添加0.   



### Number Parser  
数字分析功能

> 扩展 String  

chineseNumber `属性` 通过字符串中的中文文本, 得到一个数值.   

mixChineseNumber `属性` 通过字符串中的中文文本, 得到一个数值, 包含阿拉伯数字.  


### String Extra  
字符串扩展 

> 扩展 String  

apartBy `函数` 通过`gap[String]`分割一个字符串, 得到两个字符串.   

apartReverseBy `函数`, 等同于apartBy, 但是是通过倒序分析.   

fileExits `属性` 判断文件是否存在.   

### Value
数据判断    

> 函数 isEmpty   
判断数据`l [dynamic]`是否为空.   

> 扩展 PairJudge   

judge `函数` 判断后续的系列语句是否正确, 然后返回可选, 意义不明.    


### Time
时间处理

> 扩展 DateTime  

> dateTimeString `属性` 日期时间的全部显示  

> dateString `属性` 日期显示  

> timeString `属性` 时间显示   

> simpleString `属性` 简化版显示日期时间   

> 扩展String

dateTime `[属性]` 从文本获得时间   


## system
系统功能集合

### Image Extra  
自动存储的图片扩展   

注意: 要使用Stoage对应的同步操作, 必须先执行好await FilePath().setup();

> 函数 imageFromId  

通过Storage Id得到一个File Image. Storage ID由FileImage::Save 或者FileImage::SaveSync, FileImage::copyToStorage, FileImage::copyToStorageAsync得到.  

> 函数 imageFromIdAsync  

与imageFromId相同, 不过, 这个是异步的.  

> 函数 imageToStorage  

拷贝一个图片文件`sourcePath [String]`到Storage, 并且得到一个Storage ID.    

> 函数 imageToStorageAsync  

与imageToStorage相同, 异步.  

> 扩展 FileImage  


saveToStorage `函数` 保存图片, 保存之后, 会得到一个Storage ID.  

saveToStorageAsync `函数` 保存图片, 与save相同, 异步.  



### File Path  
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


### ImageProviderExtra   
图片提供器的存储功能   

> 扩展  ImageProvider   

saveToFile `[函数]` 存储图片到特定的文件中去   

saveToStorage `[函数]`  存储图片到storage库中去   



## ui
界面控件封装

### Clip 对控件进行切割

> 扩展 Widget

clipRect `[函数]` 切割成矩形  

clipRRect `[函数]` 切割成圆角矩形  

clipRound `[函数]` 切割成圆形  

clipPath `[函数]` 切割成Path指定的图形  


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

> 类 TextBar 

text `[属性]` 文本内容  

color `[属性]` 背景色彩  

textColor `[属性]` 文本色彩  

fontSize `[属性]` 文本字体大小  

radius `[属性]` 文本框的圆角大小  

> 扩展 String  

bar `[函数]` 从文本能得到TextBar  





> 类 IconTextBar  

text `[属性]` 文本内容  

icon `[属性]` 图标  

iconColor `[属性]` 图标颜色  

textColor `[属性]` 文本颜色  

iconSize `[属性]` 图标尺寸  

fontSize `[属性]` 文本字体大小  

vertical `[属性]` 是否竖排, 如果否的话, 则为横排.  


> 类 Capsule  

mainText `[属性]` 主文本  

subText `[属性]` 次文本  

fontSize `[属性]` 字体大小  

mainColor `[属性]` 主文本色彩  

subColor `[属性]` 次文本色彩  

cornerRadius `[属性]` 圆角大小  


> 类 PhotoFrame  
带框图片  

picture `[属性]` 图片  

icon `[属性]` 提示图标  

iconSize `[属性]` 图标尺寸  

iconColor `[属性]` 图标色彩  

borderColor `[属性]` 边框色彩  

borderWidth `[属性]` 边框宽度  

alignment `[属性]` 图标在图片框的什么位置  


> 类 ColorTab  
用色彩区分的Tab控件   

tabs `[属性]` 文本和背景色的列表  

selectedIndex `[属性]` 当前选中的tab  

textColor `[属性]` 文本色彩  

fontSize `[属性]` 文本字体大小  

colorReverse `[属性]`  色彩是否调转, 如果调转, 普通tab背景色偏白, 选中tab背景色为正常. 否则, 普通tab背景正常, 选中tab背景色偏白.  

onSelectTab `[属性]` 选中某个tab而执行的函数.  


### GridList   
方框列表控件   

> 类 GridList   

rowNumber `属性`, 横向元素数量.  

selectedIndex `属性`, 当前选中的Grid.  

count `[属性]`, 总数.  

onSelectIndex `属性`, 选中某个Grid之后产生的事件.  

spacing `属性`, 分割尺寸.  

itemBuilder `属性`, 建造一个具体Grid的内容.  

### ImageBarWithPicker
带图片选取器的图片显示   

> 类 ImageBarWithPicker

onUpdate `[函数]` 当更新图片后, 执行本函数, 参数为图片文件地址. 

### MultiImageBarWithPicker
带图片选取器的多图片显示   

> 类 MultiImageBarWithPicker

leadText `[属性]` 标题文本  

emptyText `[属性]` 空白内容显示的文本  

iconColor `[属性]` 图标颜色, 图标为指向拍摄和选择图片列表功能的两个图标.  

imageHeight `[属性]` 图片高度  

deleteTitle `[属性]` 删除确认对话框中删除文本  

deleteCancel `[属性]` 删除确认对话框中取消文本  

deleteContent `[属性]` 删除确认对话框中主体文本  

imageFileList `[属性]` 初始化的图片文件列表  

onUpdateFileList `[属性]` 当更新图片文件列表的时候, 执行本函数  







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

> 扩展 List<TextSpan>  

richText `[函数]` 生成RichText  
从TextSpan列表获取富文本控件. `list [List<TextSpan>]`文本列表, `textAlign [TextAlign]` 文本的对齐模式, `textDirection [TextDirection]` 文本的方向, `softWrap [bool]` 软换行, `overflow [TextOverflow]` 文本溢出的处理方式, `textScaleFactor [double]` 文本放大倍数, `maxLines [int]` 最大的文本行数, `locale [Locale]` 文本所属的地区设置.   




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


### MultiTagList  

> 类  MultiTagList   
支持自动换行的Tag列表控件, 多选.   

texts  `属性` 文本列表.   

selectedTags  `属性` 当前选中的Tag列表.   

fontSize  `属性` 文本大小.   

onSelectTags  `属性`  选中某个Tag之后产生的事件.   

selectedColor   `属性`  选中的Tag元素背景色.   

unselectedColor   `属性` 未选中的Tag元素背景色.   

textColor   `属性` 文本的色彩.   

### TagGrid  

> 类  TagGrid   
支持表格模式的图标表格控件.   

selected `[属性]` 初始化选中的图标  

onSelect `[属性]` 选中某个图标的时候, 执行的函数  

icons `[属性]` 图标列表  




### Multi Widget
基于多个控件列表的扩展 

> 扩展 List<T extends Widget>

row `[函数]` 将控件列表生成横向排列  

column `[函数]` 将控件列表生成竖向排列  

flow `[函数]` 将控件列表生成由FlowDelegate指定的控件列表, 一般用于右键菜单类似组件  

listBody `[函数]` 将控件列表生成ListBody  

pageView `[函数]` 将控件列表生成页面列表  

listView `[函数]` 将控件列表生成排列列表(与row/column不同, 这个带滚动功能)  

gridViewByDelegate `[函数]` 将控件列表生成通过delegate生成表格   

gridViewByCount `[函数]` 将控件列表生成通过规划生成表格   

gridViewByLimit `[函数]` 将控件列表生成通过限制生成表格   

sliverList `[函数]` 将控件列表生成适用于ScrollView的Sliver列表   

wrap `[函数]` 将控件列表生成换行排列.  






> 扩展 List<T extends Positioned> 

stack `[函数]` 将控件列表(必须是Position), 生成Stack控件.  



> 扩展 List<T extends SliverWithKeepAliveWidget>  

scrollView `[函数]` 将控件列表生成一个滚动控件.   




### TextDisplay   

> 扩展  String   
字符串的显示扩展功能   

text `函数`, 从字符串得到文本控件.  属性与标准的Text控件相同.  

textTitle  `函数`, 从字符串得到标题文本控件. 字符大小由上级Theme指定.   

textSubtitle  `函数`, 从字符串得到副标题文本控件.  字符大小由上级Theme指定.   

textBodyBold  `函数`, 从字符串得到宽文本控件.  字符大小由上级Theme指定.   

textBodyNormal   `函数`, 从字符串得到标准文本控件.  字符大小由上级Theme指定.    

textAction  `函数`, 从字符串得到操作所用的文本控件.  字符大小由上级Theme指定.    

textSpan  `函数`, 从字符串得到TextSpan控件, `style [TextStyle]`为文本显示形式,  `onTap` 为点击文本的时候, 产生的事件.   



### WidgetExtra   


> 扩展  Widget   

onTap  `函数`,  点击事件的控件.  

onPress   `函数`,  按下/释放事件的控件.   

box   `[函数]`, 生成一个Container控件.   

sized   `函数`, 设置尺寸大小的控件.   

widthed `函数`, 设置控件的宽度.   

heighted `函数`, 设置控件的高度.   

rotated   `函数`, 旋转控件.   

expanded  `函数`, 扩大化控件.   

sliver  `函数`, 将当前控件Sliver化.   

opacity  `函数`, 将当前控件半透明化(0为透明, 1为不透明)   

positioned  `函数`, 适配Stack的内部子控件.  

apsect  `函数`, 设定宽高比的控件.  

center / left / right / top / bottom / leftTop / rightTop / leftBottom / rightBottom `属性`, 位置设定控件.   

offset `函数`, 通过0(左或上)到1(右或下)指定位置设定控件.  

onListen `[函数]`, 指定监听某个通知, 当子控件发出一个通知的时候, onNotification会执行.   

overflow `[函数]`, 限定范围的可超过内容.   

constrain `[函数]`, 给出约束尺寸.   

rotate `[函数]`, 指定控件的旋转.   

scale `[函数]`, 指定控件的拉伸.    

move `[函数]`, 指定控件的移动.   

hide `[函数]`, 指定控件是否隐藏.   

fit `[函数]`, 指定子内容在本内容中的约束方式, 使用BoxFix限定.   

card `[函数]`, 展示一个卡形状.   



### Help
显示帮助页面

> 函数 showHelp

context `参数` 绘制对象   

items `参数` 各个帮助的元素, 包括文本, 带箭头的线条(两个点)   
