import 'package:coastline/draw/canvas_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './help_item.dart';
import './widget_extra.dart';

showHelp({BuildContext context, List<HelpItem> items}) {
  final screenSize = MediaQuery.of(context).size;
  List<Widget> children = [
    Positioned(
      child: CircleAvatar(
        child: Icon(Icons.close),
      ).onTap(() {
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
      arrowPoint: Offset(e.arrowPoint.dx * screenSize.width,
          e.arrowPoint.dy * screenSize.height),
      endPoint: Offset(
          e.endPoint.dx * screenSize.width, e.endPoint.dy * screenSize.height),
    );
    children.add(Positioned(
        child: CanvasView(
            size: screenSize,
            onPaint: (canvas, size) {
              canvas.drawHelpItem(item);
            })));
  }

  showDialog(
    context: context,
    builder: (c) {
      return SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: children,
        ),
      );
    },
  );
}
