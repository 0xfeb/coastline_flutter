import 'number_extra.dart';

extension DateTimeExtra on DateTime {
  /// >>> 日期时间的字符串 >>>
  String get dateTimeString {
    String y = year.digitsString(digitNumber: 4);
    String m = month.digitsString(digitNumber: 2);
    String d = day.digitsString(digitNumber: 2);
    String h = hour.digitsString(digitNumber: 2);
    String min = minute.digitsString(digitNumber: 2);
    String sec = second.digitsString(digitNumber: 2);

    return '$y-$m-$d $h:$min:$sec';
  }

  /// >>> 日期字符串 >>>
  String get dateString {
    String y = year.digitsString(digitNumber: 4);
    String m = month.digitsString(digitNumber: 2);
    String d = day.digitsString(digitNumber: 2);

    return '$y-$m-$d';
  }

  /// >>> 时间字符串 >>>
  String get timeString {
    String h = hour.digitsString(digitNumber: 2);
    String min = minute.digitsString(digitNumber: 2);
    String sec = second.digitsString(digitNumber: 2);

    return '$h:$min:$sec';
  }

  /// >>> 获取简化版显示的时间字符串 >>>
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
  /// >>> 从文本获得时间 >>>
  DateTime get dateTime {
    return DateTime.parse(this);
  }
}
