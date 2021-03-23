import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogAction {
  final String title;
  final Color color;
  final Function(BuildContext context) action;

  /// >>> 对话框按钮 >>>
  DialogAction({@required this.title, this.color, this.action});

  /// >>> 删除按钮 >>>
  static DialogAction destroy(
      {@required String title, Function(BuildContext context) action}) {
    return DialogAction(
      title: title,
      color: Colors.red,
      action: (context) {
        if (action != null) {
          action(context);
        }
        Navigator.of(context).pop();
      },
    );
  }

  /// >>> 确认按钮 >>>
  static DialogAction accept(
      {@required String title,
      @required Function(BuildContext context) action}) {
    return DialogAction(
      title: title,
      color: Colors.green,
      action: (context) {
        if (action != null) {
          action(context);
        }
        Navigator.of(context).pop();
      },
    );
  }

  /// >>> 取消按钮 >>>
  static DialogAction cancel(
      {@required String title, Function(BuildContext context) action}) {
    return DialogAction(
      title: title,
      color: Colors.grey,
      action: (context) {
        if (action != null) {
          action(context);
        }
        Navigator.of(context).pop();
      },
    );
  }
}

extension ContextExtra on BuildContext {
  /// >>> 现实对话框 >>>
  Future<T> showAlert<T>({
    @required String title,
    String subTitle,
    Color titleColor = Colors.black,
    Color subTitleColor = Colors.grey,
    double titleFontSize = 20,
    double subTitleFontSize = 16,
    @required List<DialogAction> actions,
    bool barrierDismissible = true,
  }) async {
    return showDialog(
        context: this,
        builder: (context) {
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
                ),
                onTap: e.action(context),
              );
            }).toList(),
          );
        },
        barrierDismissible: barrierDismissible);
  }

  /// >>> 显示提示条 >>>
  showSnack(Widget child, {Color color}) async {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: child,
      backgroundColor: color,
    ));
  }
}
