import 'number_extra.dart';

extension DateTimeExtra on DateTime {
  String get dateTimeString {
    String y = fourDigits(year);
    String m = twoDigits(month);
    String d = twoDigits(day);
    String h = twoDigits(hour);
    String min = twoDigits(minute);
    String sec = twoDigits(second);

    return '$y-$m-$d $h:$min:$sec';
  }

  String get dateString {
    String y = fourDigits(year);
    String m = twoDigits(month);
    String d = twoDigits(day);

    return '$y-$m-$d';
  }

  String get timeString {
    String h = twoDigits(hour);
    String min = twoDigits(minute);
    String sec = twoDigits(second);

    return '$h:$min:$sec';
  }

  /// >>> 获取简化版显示的时间字符串 >>>
  String get simpleString {
    DateTime _now = DateTime.now();
    DateTime now = DateTime(_now.year, _now.month, _now.day);
    DateTime thisDate = DateTime(year, month, day);
    Duration d = now.difference(thisDate);

    String h = twoDigits(hour);
    String min = twoDigits(minute);
    String sec = twoDigits(second);
    if (d > Duration(days: 3)) {
      return dateTimeString;
    } else if (d > Duration(days: 2)) {
      return '前天 $h:$min:$sec';
    } else if (d > Duration(days: 1)) {
      return '昨天 $h:$min:$sec';
    } else {
      return '今天 $h:$min:$sec';
    }
  }
}
