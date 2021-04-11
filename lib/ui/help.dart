import 'package:coastline/draw/canvas_view.dart';
import 'package:flutter/cupertino.dart';

import './help_item.dart';

class Help extends StatelessWidget {
  final List<HelpItem> items;

  const Help({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Expanded(
        child: Stack(
      children: items.map((e) {
        HelpItem item = HelpItem(
          color: e.color,
          text: e.text,
          arrowPoint: Offset(e.arrowPoint.dx * screenSize.width,
              e.arrowPoint.dy * screenSize.height),
          endPoint: Offset(e.endPoint.dx * screenSize.width,
              e.endPoint.dy * screenSize.height),
        );
        return Positioned(child: CanvasView(onPaint: (canvas, size) {
          canvas.drawHelpItem(item);
        }));
      }).toList(),
    ));
  }
}
