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
