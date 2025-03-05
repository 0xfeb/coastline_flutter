import 'package:coastline/draw/draw_view.dart';
import 'package:flutter/material.dart';
import './help_item.dart';
import './widget_extra.dart';

/// 显示全屏帮助提示对话框
///
/// 该函数通过[showGeneralDialog]创建全屏透明对话框，使用[DrawView]绘制多个帮助项
///
/// @param context 构建上下文，用于对话框的创建和导航
/// @param items 帮助项列表，每个[HelpItem]包含：
///   - text: 显示的文字内容
///   - arrowPoint: 箭头尖端坐标（相对屏幕比例）
///   - endPoint: 文本终点坐标（相对屏幕比例）
///   - color: 绘制颜色
/// @return 通过[showGeneralDialog]返回Dialog实现，无显式返回值
showHelp({required BuildContext context, required List<HelpItem> items}) {
  Size size = MediaQuery.of(context).size;
  List<Widget> children = [
    Positioned(
      child: CircleAvatar(
        child: Icon(Icons.close),
        backgroundColor: Colors.redAccent,
      ).onTap(() {
        print('on tap');
        Navigator.of(context).pop();
      }),
      width: 30,
      height: 30,
      left: 20,
      top: 40,
    ),
  ];
  for (HelpItem e in items) {
    HelpItem item = HelpItem(
      color: e.color,
      text: e.text,
      arrowPoint:
          Offset(e.arrowPoint!.dx * size.width, e.arrowPoint!.dy * size.height),
      endPoint:
          Offset(e.endPoint!.dx * size.width, e.endPoint!.dy * size.height),
    );
    children.insert(
      0,
      Positioned(
        child: DrawView(
          size: size,
          onPaint: (canvas, size) {
            canvas.drawHelpItem(item);
          },
        ),
      ),
    );
  }

  showGeneralDialog(
    context: context,
    pageBuilder: (c, ani1, ani2) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: children,
          ),
        ),
      ).sized(size: size);
    },
  );
}
