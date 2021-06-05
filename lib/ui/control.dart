import 'package:flutter/material.dart';
import '../structure/combo_data.dart';
import 'widget_extra.dart';

/// >>> 文本条 >>>
Widget textBar(
  String text, {
  Color color = Colors.blue,
  Color textColor = Colors.white,
  double fontSize = 14,
}) {
  return Container(
    padding:
        EdgeInsets.fromLTRB(fontSize, fontSize / 2, fontSize, fontSize / 2),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(4), color: color),
    child: Text(text, style: TextStyle(color: textColor, fontSize: fontSize)),
  );
}

/// >>> 带有文本的图标 >>>
Widget textIcon(
  String text,
  IconData icon, {
  Color iconColor = Colors.blue,
  Color textColor = Colors.blue,
  double iconSize = 20,
  double fontSize = 14,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(icon, size: iconSize, color: iconColor),
      Text(text, style: TextStyle(color: textColor, fontSize: fontSize)),
    ],
  );
}

/// >>> 药丸结构(双文本) >>>>
Widget capsule(
  String mainText,
  String subText, {
  double fontSize = 14,
  Color mainColor = Colors.blue,
  Color subColor = Colors.white,
  double cornerRadius = 4,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding:
            EdgeInsets.fromLTRB(fontSize, fontSize / 2, fontSize, fontSize / 2),
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
        padding:
            EdgeInsets.fromLTRB(fontSize, fontSize / 2, fontSize, fontSize / 2),
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

/// >>> 相框图片(带图标提示) >>>
// todo: 以后改成icon镂空, 研究怎么镂空文本, 怎么镂空Image, 怎么镂空Icon
Widget imageFrame(
  ImageProvider picture, {
  required IconData icon,
  double iconSize = 16,
  Color iconColor = Colors.grey,
  Color borderColor = Colors.white,
  double borderWidth = 6,
}) {
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
    alignment: Alignment.bottomRight,
    child: Container(
      decoration: BoxDecoration(
          color: borderColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8))),
      padding: EdgeInsets.all(4),
      child: Icon(icon, color: iconColor, size: iconSize),
    ),
  );
}

/// >>> 色彩Tab >>>
Widget colorTabs({
  required List<Pair<String, Color>> tabs,
  int selectedIndex = 0,
  Color textColor = Colors.white,
  double fontSize = 14,
  bool colorReverse = false,
  required Function(int index) onSelectTab,
}) {
  List<Widget> list = [];
  for (int i = 0; i < tabs.length; ++i) {
    String title = tabs[i].a;
    Color? colorSelect =
        colorReverse ? Color.lerp(tabs[i].b, Colors.white, 0.3) : tabs[i].b;
    Color? colorUnSelect =
        colorReverse ? tabs[i].b : Color.lerp(tabs[i].b, Colors.white, 0.3);
    Color? color = selectedIndex == i ? colorSelect : colorUnSelect;
    double leftRadius = i == 0 ? 8 : 0;
    double rightRadius = i == tabs.length - 1 ? 8 : 0;
    Widget tab = Container(
      child: Center(
        child:
            Text(title, style: TextStyle(color: textColor, fontSize: fontSize)),
      ),
      padding:
          EdgeInsets.fromLTRB(fontSize, fontSize / 2, fontSize, fontSize / 2),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(leftRadius),
            right: Radius.circular(rightRadius),
          ),
          border:
              Border.all(color: tabs[i].b, width: selectedIndex == i ? 1 : 0)),
    ).onTap(() {
      onSelectTab(i);
    });
    list.add(Expanded(child: tab));
  }
  return Row(children: list);
}
