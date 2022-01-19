import 'package:coastline/draw/canvas_view.dart';
import 'package:flutter/material.dart';
import './help_item.dart';
import './widget_extra.dart';

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
        child: CanvasView(
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
