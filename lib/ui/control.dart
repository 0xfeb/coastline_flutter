import '../structure/combo_data.dart';
import 'package:flutter/material.dart';

class Control {
  /// >>> 文本条 >>>
  static Widget bar(
    String text, {
    Color color = Colors.blue,
    double fontSize = 14,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          fontSize * 2, fontSize / 2, fontSize * 2, fontSize / 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Text(text, style: TextStyle(color: color, fontSize: fontSize)),
    );
  }

  /// >>> 带有文本的图标 >>>
  static Widget icon({
    @required IconData icon,
    @required String text,
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
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
  static Widget capsule({
    @required String mainText,
    @required String subText,
    double fontSize = 14,
    @required Color mainColor,
    Color subColor = Colors.white,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              fontSize * 2, fontSize / 2, fontSize * 2, fontSize / 2),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
          ),
          child: Text(mainText,
              style: TextStyle(fontSize: fontSize, color: subColor)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              fontSize * 2, fontSize / 2, fontSize * 2, fontSize / 2),
          decoration: BoxDecoration(
            color: subColor,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
          ),
          child: Text(mainText,
              style: TextStyle(fontSize: fontSize, color: mainColor)),
        ),
      ],
    );
  }

  /// >>> 相框图片(带图标提示) >>>
  static Widget frame({
    @required ImageProvider picture,
    @required IconData icon,
    double iconSize = 16,
    Color iconColor = Colors.grey,
    Color borderColor = Colors.white,
    double borderWidth = 6,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: picture,
          fit: BoxFit.contain,
        ),
        color: borderColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      alignment: Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(4),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }

  /// >>> 色彩Tab >>>
  static Widget tab({
    @required List<Pair<String, Color>> tabs,
    int selectedIndex = 0,
    Color textColor = Colors.white,
    double fontSize = 18,
    @required Function(int index) onSelectTab,
  }) {
    List<Widget> list = [];
    for (int i = 0; i < tabs.length; ++i) {
      String title = tabs[i].a;
      Color color = tabs[i].b;
      double leftRadius = i == 0 ? 8 : 0;
      double rightRadius = i == tabs.length - 1 ? 8 : 0;
      Widget tab = Container(
        child:
            Text(title, style: TextStyle(color: textColor, fontSize: fontSize)),
        padding: EdgeInsets.fromLTRB(
            fontSize * 2, fontSize / 2, fontSize * 2, fontSize / 2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(leftRadius),
            right: Radius.circular(rightRadius),
          ),
        ),
      );
      list.add(Expanded(child: tab));
    }
    return Row(children: list);
  }
}
