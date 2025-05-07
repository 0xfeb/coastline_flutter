import 'package:flutter/material.dart';

import 'widget_extra.dart';

/// >>> 文本条 >>>
/// 文本条控件
///
/// 提供带背景色的文字展示组件，支持自定义圆角、文字大小和颜色
class TextBar extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;
  final double radius;

  /// 创建文本条组件
  ///
  /// [text] 需要显示的文本内容
  /// [color] 背景颜色（默认蓝色）
  /// [textColor] 文字颜色（默认白色）
  /// [fontSize] 文字尺寸（默认14）
  /// [radius] 圆角半径（默认4）
  TextBar(
    this.text, {
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.radius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.fromLTRB(fontSize, fontSize / 2, fontSize, fontSize / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: color),
      child: Text(text, style: TextStyle(color: textColor, fontSize: fontSize)),
    );
  }
}

extension TextBarExtra on String {
  Widget bar(
      {Color color = Colors.blue,
      Color textColor = Colors.white,
      double fontSize = 14,
      double radius = 4}) {
    return TextBar(
      this,
      color: color,
      textColor: textColor,
      fontSize: fontSize,
      radius: radius,
    );
  }
}

/// >>> 带有文本的图标 >>>

class IconTextBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final double iconSize;
  final double fontSize;
  final bool vertical;

  IconTextBar(
    this.text,
    this.icon, {
    this.iconColor = Colors.blue,
    this.textColor = Colors.blue,
    this.iconSize = 20,
    this.fontSize = 14,
    this.vertical = true,
  });

  @override
  Widget build(BuildContext context) {
    return vertical
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: iconSize, color: iconColor),
              Text(text,
                  style: TextStyle(color: textColor, fontSize: fontSize)),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: iconSize, color: iconColor),
              Text(text,
                  style: TextStyle(color: textColor, fontSize: fontSize)),
            ],
          );
  }
}

/// >>> 药丸结构(双文本) >>>>
class Capsule extends StatelessWidget {
  final String mainText;
  final String subText;
  final double fontSize;
  final Color mainColor;
  final Color subColor;
  final double cornerRadius;

  Capsule({
    required this.mainText,
    required this.subText,
    this.fontSize = 14,
    this.mainColor = Colors.blue,
    this.subColor = Colors.white,
    this.cornerRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              fontSize, fontSize / 2, fontSize, fontSize / 2),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius:
                BorderRadius.horizontal(left: Radius.circular(cornerRadius)),
            border: Border.all(color: mainColor),
          ),
          child: Text(mainText,
              style: TextStyle(fontSize: fontSize, color: subColor)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              fontSize, fontSize / 2, fontSize, fontSize / 2),
          decoration: BoxDecoration(
            color: subColor,
            borderRadius:
                BorderRadius.horizontal(right: Radius.circular(cornerRadius)),
            border: Border.all(color: mainColor),
          ),
          child: Text(mainText,
              style: TextStyle(fontSize: fontSize, color: mainColor)),
        ),
      ],
    );
  }
}

/// >>> 相框图片(带图标提示) >>>
// todo: 以后改成icon镂空, 研究怎么镂空文本, 怎么镂空Image, 怎么镂空Icon
class PhotoFrame extends StatelessWidget {
  final ImageProvider picture;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color borderColor;
  final double borderWidth;
  final Alignment alignment;

  PhotoFrame(
    this.picture, {
    required this.icon,
    this.iconSize = 16,
    this.iconColor = Colors.grey,
    this.borderColor = Colors.white,
    this.borderWidth = 6,
    this.alignment = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: picture,
          fit: BoxFit.cover,
        ),
        color: borderColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8))),
        padding: EdgeInsets.all(4),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}

/// >>> 色彩Tab >>>
class ColorTab extends StatelessWidget {
  final List<(Color, String)> tabs;
  final int selectedIndex;
  final Color textColor;
  final double fontSize;
  final bool colorReverse;
  final Function(int index) onSelectTab;

  ColorTab({
    required this.tabs,
    this.selectedIndex = 0,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.colorReverse = false,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < tabs.length; ++i) {
      String title = tabs[i].$2;
      Color? colorSelect =
          colorReverse ? Color.lerp(tabs[i].$1, Colors.white, 0.3) : tabs[i].$1;
      Color? colorUnSelect =
          colorReverse ? tabs[i].$1 : Color.lerp(tabs[i].$1, Colors.white, 0.3);
      Color? color = selectedIndex == i ? colorSelect : colorUnSelect;
      double leftRadius = i == 0 ? 8 : 0;
      double rightRadius = i == tabs.length - 1 ? 8 : 0;
      Widget tab = Container(
        child: Center(
          child: Text(title,
              style: TextStyle(color: textColor, fontSize: fontSize)),
        ),
        padding:
            EdgeInsets.fromLTRB(fontSize, fontSize / 2, fontSize, fontSize / 2),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(leftRadius),
              right: Radius.circular(rightRadius),
            ),
            border: Border.all(
                color: tabs[i].$1, width: selectedIndex == i ? 1 : 0)),
      ).onTap(() {
        onSelectTab(i);
      });
      list.add(Expanded(child: tab));
    }
    return Row(children: list);
  }
}
