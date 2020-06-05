import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

extension ExtString on String {
  String repeat(int count) {
    return List.filled(count, this).join();
  }

  bool get isValid {
    if (this == null) {
      return false;
    }
    return this.isNotEmpty;
  }

  bool get isInvalid {
    return !this.isValid;
  }

  Map<String, dynamic> toDict() {
    return jsonDecode(this);
  }

  bool _isUrlWithPotocol() {
    RegExp exp = RegExp(
        r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+\.(?:[a-zA-Z]|[0-9]|[$-_@&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+');
    var str = exp.stringMatch(this);
    return (str == this);
  }

  bool _isUrlWithoutPotocol() {
    RegExp exp = RegExp(
        r'(?:[a-zA-Z]|[0-9]|[$-_@&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+\.(?:[a-zA-Z]|[0-9]|[$-_@&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+');
    var str = exp.stringMatch(this);
    return (str == this);
  }

  bool get isUrl {
    if (this == null) {
      return false;
    }

    return _isUrlWithPotocol() || _isUrlWithoutPotocol();
  }

  String get MD5 {
    List<int> list = utf8.encode(this);
    Digest dig = md5.convert(list);
    String dest = Base64Encoder().convert(dig.bytes);
    return dest;
  }

  bool get containsUpperAlpha {
    return this.contains(RegExp(r'[A-Z]'));
  }

  bool get containsLowerAlpha {
    return this.contains(RegExp(r'[a-z]'));
  }

  bool get containsNumber {
    return this.contains(RegExp(r'[0-9]'));
  }

  bool get containsSymbol {
    return this.contains(RegExp(r'[!`~@#$%^&*()-=_+\[\]{}\\\|;:",./<>\?]'));
  }

  bool containsAlphaSkipCase(String text) {
    return this.toUpperCase().contains(text.toUpperCase());
  }

  String abbreviate(int maxLength) {
    if (this == null || this.length <= maxLength) {
      return this;
    }

    if (maxLength < 2) {
      return "..";
    }

    return this.substring(0, maxLength - 2) + "..";
  }

  String trimAll() {
    return this.replaceAll(' ', '');
  }

  String fixFront(String fixText, int fixedLength) {
    int addLength = fixedLength - fixText.length;
    if (addLength <= 0) {
      return this;
    }
    String fix = fixText.repeat(addLength).substring(0, addLength);
    return fix + this;
  }

  String fixEnd(String fixText, int fixedLength) {
    int addLength = fixedLength - fixText.length;
    if (addLength <= 0) {
      return this;
    }
    String fix = fixText.repeat(addLength).substring(0, addLength);
    return this + fix;
  }
}

extension ExtMap<K, V> on Map<K, V> {
  String toJsonString() {
    return jsonEncode(this);
  }
}

extension ExtNumber on int {
  String zeroFixed(int bits) {
    var numberString = this.toString();
    if (numberString.length >= bits) {
      return numberString;
    } else {
      return '0'.repeat(bits - numberString.length);
    }
  }
}

enum ListAction { add, remove }

extension ExtList<T> on List<T> {
  Map<ListAction, T> actionsByDest(List<T> dest) {
    int length1 = this == null ? 0 : this.length;
    int length2 = dest == null ? 0 : dest.length;
    Map<ListAction, T> result = {};

    for (int i = 0; i < length1; ++i) {
      T item = this[i];
      if (dest == null) {
        result[ListAction.add] = item;
      } else if (!dest.contains(item)) {
        result[ListAction.add] = item;
      }
    }

    for (int j = 0; j < length2; ++j) {
      T item = dest[j];
      if (this == null) {
        result[ListAction.remove] = item;
      } else if (!this.contains(item)) {
        result[ListAction.remove] = item;
      }
    }

    return result;
  }
}

extension ExtListInt on List<int> {
  Uint8List toUint8List() {
    return Uint8List.fromList(this);
  }
}
