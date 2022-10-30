import 'package:flutter/material.dart';

class DialogAction {
  final String title;
  final Color? color;
  final Function()? action;
  final bool close;

  /// >>> 对话框按钮 >>>
  DialogAction(
      {this.close = false, required this.title, this.color, this.action});

  /// >>> 删除按钮 >>>
  static DialogAction destroy(
      {required String title, Function()? action, bool close = true}) {
    return DialogAction(
      title: title,
      color: Colors.red,
      action: action,
      close: close,
    );
  }

  /// >>> 确认按钮 >>>
  static DialogAction accept(
      {required String title, Function()? action, bool close = true}) {
    return DialogAction(
      title: title,
      color: Colors.green,
      action: action,
      close: close,
    );
  }

  /// >>> 取消按钮 >>>
  static DialogAction cancel(
      {required String title, Function()? action, bool close = true}) {
    return DialogAction(
      title: title,
      color: Colors.grey,
      action: action,
      close: close,
    );
  }
}

extension ContextExtra on BuildContext {
  /// >>> 实现对话框 >>>
  Future showAlert({
    required String title,
    String subTitle = '',
    Color titleColor = Colors.black,
    Color subTitleColor = Colors.grey,
    double titleFontSize = 20,
    double subTitleFontSize = 16,
    required List<DialogAction> actions,
    bool barrierDismissible = true,
  }) async {
    return showDialog(
        context: this,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: titleColor, fontSize: titleFontSize),
            ),
            content: Text(
              subTitle,
              style:
                  TextStyle(color: subTitleColor, fontSize: subTitleFontSize),
            ),
            actions: actions.map((e) {
              return InkWell(
                  child: Container(
                    height: 35,
                    width: 110,
                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: e.color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      e.title,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    margin: EdgeInsets.all(8),
                  ),
                  onTap: () {
                    if (e.action != null) {
                      e.action!();
                    }
                    if (e.close) {
                      Navigator.of(ctx).pop();
                    }
                  });
            }).toList(),
          );
        },
        barrierDismissible: barrierDismissible);
  }

  /// >>> 显示提示条 >>>
  showSnack(Widget child, {Color color = Colors.grey}) async {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: child,
      backgroundColor: color,
    ));
  }

  /// >>> 显示提示条文本 >>>
  showSnackTitle(String title, {Color color = Colors.grey}) async {
    showSnack(
      Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      color: color,
    );
  }
}
