import 'package:flutter/material.dart';

/// 对话框操作按钮配置类
/// 
/// 用于定义对话框按钮的样式和行为，可通过静态方法快速创建常用按钮
class DialogAction {
  /// 按钮显示文本
  final String title;
  
  /// 按钮背景颜色（可选）
  final Color? color;
  
  /// 按钮点击回调函数（可选）
  final Function()? action;
  
  /// 点击后是否自动关闭对话框
  final bool close;
  
  /// 创建对话框按钮
  /// 
  /// [title] 按钮显示文本（必填）
  /// [close] 点击后是否自动关闭对话框（默认false）
  /// [color] 按钮背景颜色（可选）
  /// [action] 点击回调函数（可选）
  DialogAction(
      {this.close = false, required this.title, this.color, this.action});
  
  /// 创建红色销毁操作按钮
  /// 
  /// [title] 按钮显示文本
  /// [action] 点击回调函数（可选）
  /// [close] 点击后是否关闭对话框（默认true）
  static DialogAction destroy(
      {required String title, Function()? action, bool close = true}) {
    return DialogAction(
      title: title,
      color: Colors.red,
      action: action,
      close: close,
    );
  }
  
  /// 创建绿色确认操作按钮
  /// 
  /// [title] 按钮显示文本
  /// [action] 点击回调函数（可选）
  /// [close] 点击后是否关闭对话框（默认true）
  static DialogAction accept(
      {required String title, Function()? action, bool close = true}) {
    return DialogAction(
      title: title,
      color: Colors.green,
      action: action,
      close: close,
    );
  }
  
  /// 创建灰色取消操作按钮
  /// 
  /// [title] 按钮显示文本
  /// [action] 点击回调函数（可选）
  /// [close] 点击后是否关闭对话框（默认true）
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

/// 为BuildContext添加的对话框扩展方法
extension ContextExtra on BuildContext {
  /// 显示通用对话框
  /// 
  /// [title] 对话框标题（必填）
  /// [subTitle] 对话框副标题（默认空字符串）
  /// [titleColor] 标题文本颜色（默认黑色）
  /// [subTitleColor] 副标题文本颜色（默认灰色）
  /// [titleFontSize] 标题字体大小（默认20）
  /// [subTitleFontSize] 副标题字体大小（默认16）
  /// [actions] 操作按钮列表（必填）
  /// [barrierDismissible] 点击背景是否可关闭（默认true）
  /// 
  /// [返回值] Future对象，可用于等待对话框关闭
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
  
  /// 显示SnackBar提示
  /// 
  /// [child] 要显示的内容组件
  /// [color] 背景颜色（默认灰色）
  void showSnack(Widget child, {Color color = Colors.grey}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: child,
      backgroundColor: color,
    ));
  }
  
  /// 显示纯文本SnackBar提示
  /// 
  /// [title] 要显示的文本内容
  /// [color] 背景颜色（默认灰色）
  void showSnackTitle(String title, {Color color = Colors.grey}) {
    showSnack(
      Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      color: color,
    );
  }
}
