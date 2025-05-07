import 'package:flutter/material.dart';

import 'widget_extra.dart';

/// >>> 数字输入框 >>>
/// 数字输入框组件
///
/// 提供带增减按钮的数字输入控件，支持最小值/最大值限制
/// 包含文本输入框和左右两侧的增减按钮交互
class NumberField extends StatelessWidget {
  /// 按钮及边框的主题颜色
  final Color color;

  /// 允许输入的最小值
  final int min;

  /// 允许输入的最大值
  final int max;

  /// 文本编辑控制器，用于获取/设置输入值
  final TextEditingController? controller;

  /// 焦点控制节点，用于管理输入框焦点状态
  final FocusNode? focus;

  /// 输入文本的样式设置
  final TextStyle style;

  /// 创建数字输入框
  ///
  /// @param key 控件键
  /// @param color 按钮及边框颜色（默认蓝色）
  /// @param min 最小值限制（默认0）
  /// @param max 最大值限制（默认10000）
  /// @param controller 文本编辑控制器（可选）
  /// @param focus 焦点控制节点（可选）
  /// @param style 输入文本样式（默认30号字体）
  const NumberField(
      {Key? key,
      this.color = Colors.blue,
      this.min = 0,
      this.max = 10000,
      this.controller,
      this.focus,
      this.style = const TextStyle(fontSize: 30)})
      : super(key: key);

  /// 构建输入框组件
  ///
  /// @param context 构建上下文
  /// @return 包含增减按钮的数字输入框组件
  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: controller,
      focusNode: focus,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.numberWithOptions(),
      style: style,
      decoration: InputDecoration(
        prefixIcon: AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ).onTap(() {
            // 处理减少数值逻辑
            // 1. 获取当前数值并减1
            // 2. 校验最小值限制
            // 3. 更新控制器数值及光标位置
            int number = min;
            bool? textNotEmpty = controller?.text.isNotEmpty;
            if (textNotEmpty == true) {
              number = int.parse(controller!.text) - 1;
              if (number < min) {
                number = min;
              }
            }
            if (controller != null) {
              controller!.text = '$number';
              controller!.selection =
                  TextSelection(baseOffset: 0, extentOffset: 0);
            }
          }),
        ),
        suffixIcon: AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ).onTap(() {
            // 处理增加数值逻辑
            // 1. 获取当前数值并加1
            // 2. 校验最大值限制
            // 3. 更新控制器数值及光标位置
            int number = max;
            bool? textNotEmpty = controller?.text.isNotEmpty;
            if (textNotEmpty == true) {
              number = int.parse(controller!.text) + 1;
              if (number > max) {
                number = max;
              }
            }
            if (controller != null) {
              controller!.text = '$number';
              controller!.selection =
                  TextSelection(baseOffset: 0, extentOffset: 0);
            }
          }),
        ),
      ),
    );
  }
}
