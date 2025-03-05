import 'number_extra.dart';

extension DateTimeExtra on DateTime {
  /// 获取日期时间的字符串表示形式，格式为 `yyyy-MM-dd HH:mm:ss`
  ///
  /// 返回一个格式化的日期时间字符串。
  String get dateTimeString {
    String y = year.digitsString(digitNumber: 4);
    String m = month.digitsString(digitNumber: 2);
    String d = day.digitsString(digitNumber: 2);
    String h = hour.digitsString(digitNumber: 2);
    String min = minute.digitsString(digitNumber: 2);
    String sec = second.digitsString(digitNumber: 2);

    return '$y-$m-$d $h:$min:$sec';
  }

  /// 获取日期的字符串表示形式，格式为 `yyyy-MM-dd`
  ///
  /// 返回一个格式化的日期字符串。
  String get dateString {
    String y = year.digitsString(digitNumber: 4);
    String m = month.digitsString(digitNumber: 2);
    String d = day.digitsString(digitNumber: 2);

    return '$y-$m-$d';
  }

  /// 获取时间的字符串表示形式，格式为 `HH:mm:ss`
  ///
  /// 返回一个格式化的时间字符串。
  String get timeString {
    String h = hour.digitsString(digitNumber: 2);
    String min = minute.digitsString(digitNumber: 2);
    String sec = second.digitsString(digitNumber: 2);

    return '$h:$min:$sec';
  }

  /// 获取简化版显示的时间字符串
  ///
  /// 根据当前日期与扩展对象日期的差异，返回不同的时间字符串表示形式。
  /// - 如果日期差异大于等于3天，返回完整的日期时间字符串。
  /// - 如果日期差异为2天，返回 "前天 HH:mm:ss"。
  /// - 如果日期差异为1天，返回 "昨天 HH:mm:ss"。
  /// - 否则，返回 "今天 HH:mm:ss"。
  ///
  /// 返回一个格式化的时间字符串。
  String get simpleString {
    DateTime _now = DateTime.now();
    DateTime now = DateTime(_now.year, _now.month, _now.day);
    DateTime thisDate = DateTime(year, month, day);
    Duration d = now.difference(thisDate);

    String h = hour.digitsString(digitNumber: 2);
    String min = minute.digitsString(digitNumber: 2);
    String sec = second.digitsString(digitNumber: 2);
    if (d >= Duration(days: 3)) {
      return dateTimeString;
    } else if (d >= Duration(days: 2)) {
      return '前天 $h:$min:$sec';
    } else if (d >= Duration(days: 1)) {
      return '昨天 $h:$min:$sec';
    } else {
      return '今天 $h:$min:$sec';
    }
  }
}

extension DateTimeString on String {
  /// 从文本获得时间对象
  ///
  /// 解析字符串为 `DateTime` 对象。
  ///
  /// 返回解析后的 `DateTime` 对象。
  DateTime get dateTime {
    return DateTime.parse(this);
  }
}