import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../draw/resource.dart';
import '../system/image_extra.dart';
import './clip.dart';
import './context_extra.dart';
import './mini_control.dart';
import './multi_widget.dart';
import './pad.dart';
import './text_display.dart';
import './widget_extra.dart';

/// 图片选择器组件
///
/// 提供相机/相册选择功能，支持图片预览和删除操作
class ImageSelector extends StatefulWidget {
  final String leadText;
  final String emptyText;
  final Color iconColor;
  final double imageHeight;
  final String deleteTitle;
  final String deleteCancel;
  final String deleteContent;
  final Function(List<String>) onUpdateFileList;
  final List<String> imageFileList;
  final int imageLimit;

  /// 创建图片选择器
  ///
  /// @param leadText 顶部引导文字
  /// @param emptyText 空状态提示文字
  /// @param onUpdateFileList 图片列表更新回调
  /// @param iconColor 图标颜色（默认蓝色）
  /// @param imageHeight 图片显示高度（默认80）
  /// @param deleteTitle 删除确认对话框标题
  /// @param deleteCancel 删除取消按钮文字
  /// @param deleteContent 删除确认内容
  /// @param imageFileList 初始图片路径列表
  /// @param imageLimit 允许选择的图片最大数量（默认1）
  const ImageSelector({
    Key? key,
    required this.leadText,
    required this.emptyText,
    required this.onUpdateFileList,
    this.iconColor = Colors.blue,
    this.imageHeight = 80,
    this.deleteTitle = 'Delete',
    this.deleteCancel = 'Cancel',
    this.deleteContent = 'Are you sure to delete picture?',
    required this.imageFileList,
    this.imageLimit = 1,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  List<String> _imageFileList = [];

  late ImagePicker _imagePicker;

  bool _inBusy = false;

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();
    _imageFileList = widget.imageFileList;
  }

  /// 处理图片选择操作
  ///
  /// @param source 图片来源（相机/相册）
  /// @return 异步操作结果
  _onChooseImage(ImageSource source) async {
    if (_inBusy == true) {
      return;
    }

    _inBusy = true;
    print('>>>> 1');
    XFile? file = await _imagePicker.pickImage(source: source);
    print('>>>> 2');
    if (file != null) {
      setState(() => _imageFileList.add(file.path));
      widget.onUpdateFileList(_imageFileList);
    }

    _inBusy = false;
  }

  /// 构建图片展示子组件
  ///
  /// 根据当前图片列表状态显示：
  /// - 空状态：显示提示文字和操作按钮
  /// - 非空状态：水平滚动图片列表
  /// @param context 构建上下文
  /// @return 图片展示区域的Widget
  Widget _subPhoto(BuildContext context) {
    if (_imageFileList.isEmpty) {
      return widget.emptyText
          .text(style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20))
          .pad(bottom: 32, top: 16)
          .center;
    } else {
      double imageSize = widget.imageHeight;
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return [
            Image(
              image: StorageImage(_imageFileList[index]).loadImage()!,
              fit: BoxFit.cover,
            )
                .sized(height: imageSize, width: imageSize)
                .clipRRect(borderRadius: 4)
                .positioned(),
            Icons.close
                .icon(size: 15, color: Colors.white)
                .box(cornerRadius: 100, color: Colors.red)
                .onTap(() {
              context.showAlert(
                  title: widget.deleteTitle,
                  subTitle: widget.deleteContent,
                  actions: [
                    DialogAction.destroy(
                        title: widget.deleteTitle,
                        action: () {
                          setState(() => _imageFileList.removeAt(index));
                        }),
                    DialogAction.cancel(title: widget.deleteCancel),
                  ]);
            }).positioned(right: 4, top: 4, width: 16, height: 16),
          ].stack().box(cornerRadius: 4, width: imageSize, height: imageSize);
        },
        separatorBuilder: (context, index) => SizedBox(width: 4),
        itemCount: _imageFileList.length,
      ).sized(height: imageSize);
    }
  }

  @override

  /// 构建组件主界面
  ///
  /// 组合引导文字和图片展示区域
  /// @param context 构建上下文
  /// @return 组件整体布局
  Widget build(BuildContext context) {
    return [
      _imageFileList.length > 0
          ? widget.leadText
              .text(style: TextStyle(fontSize: 12, color: Colors.grey[700]))
              .pad(left: 16)
          : [
              widget.leadText
                  .text(style: TextStyle(fontSize: 12, color: Colors.grey[700]))
                  .pad(left: 16),
              Icons.add_a_photo
                  .icon(size: 24, color: widget.iconColor)
                  .sized(width: 40)
                  .onTap(() => _onChooseImage(ImageSource.camera)),
              Icons.add_photo_alternate
                  .icon(size: 25, color: widget.iconColor)
                  .sized(width: 40)
                  .onTap(() => _onChooseImage(ImageSource.gallery)),
            ].row(),
      Gap(8),
      _subPhoto(context),
    ].column();
  }
}
