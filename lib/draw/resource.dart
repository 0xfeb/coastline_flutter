import 'package:flutter/material.dart';

extension IconDataExtra on IconData {
  /// >>> 图标 >>>
  Icon icon({required Color? color, double size = 20}) {
    return Icon(
      this,
      color: color,
      size: size,
    );
  }

  /// >>> 图标白色 >>>
  Icon iconWhite({double size = 20}) {
    return icon(size: size, color: Colors.white);
  }

  /// >>> 图标黑色 >>>
  Icon iconBlack({double size = 20}) {
    return icon(size: size, color: Colors.black);
  }

  /// >>> 图标灰色 >>>
  Icon iconGray({double size = 20}) {
    return icon(size: size, color: Colors.grey);
  }

  /// >>> 图标深灰色 >>>
  Icon iconDarkGray({double size = 20}) {
    return icon(size: size, color: Colors.grey[800]);
  }
}

extension ImageProviderExtra on ImageProvider {
  /// >>> 图形, 宽高比等比例填充 >>>
  Image get image {
    return Image(image: this, fit: BoxFit.cover);
  }

  /// >>> 图形, 宽高比失衡填充  >>>
  Image get imageFill {
    return Image(image: this, fit: BoxFit.fill);
  }
}
