import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

import 'type.dart';

const _ivText = 'AtC.Ss63.4234Tsc';
const _saltText = 'CSalt';

extension CryptString on String {
  String encryptMd5(String salt) {
    String passcode = salt + this + salt;
    var list = Utf8Encoder().convert(passcode);
    var md = md5.convert(list);
    return hex.encode(md.bytes);
  }

  String get encryptMd5Default {
    return encryptMd5(_saltText);
  }

  Encrypter _encrpyter(String password) {
    Key key = Key.fromUtf8(password.encryptMd5Default);
    return Encrypter(AES(key));
  }

  String encrypt(String password) {
    Encrypter encrpyter = _encrpyter(password);
    return encrpyter.encrypt(this, iv: IV.fromUtf8(_ivText)).base64;
  }

  String decrpyt(String password) {
    Encrypter encrpyter = _encrpyter(password);
    return encrpyter.decrypt(Encrypted.fromBase64(this),
        iv: IV.fromUtf8(_ivText));
  }
}

extension CryptFile on File {
  Encrypter _encrpyter(String password) {
    Key key = Key.fromUtf8(password.encryptMd5Default);
    return Encrypter(AES(key));
  }

  Future<Uint8List> readAndEncrpyt(String password) async {
    Encrypter encrypter = _encrpyter(password);
    Uint8List fileContext = await this.readAsBytes();
    IV iv = IV.fromUtf8(_ivText);
    Uint8List fileCyptedContext =
        encrypter.encryptBytes(fileContext.toList(), iv: iv).bytes;

    return fileCyptedContext;
  }

  Future<List<int>> readAndDecrypt(String password) async {
    Encrypter encrypter = _encrpyter(password);
    Uint8List fileContext = await this.readAsBytes();
    IV iv = IV.fromUtf8(_ivText);
    Encrypted encryptContext = Encrypted(fileContext);
    List<int> fileDecryptedContext =
        encrypter.decryptBytes(encryptContext, iv: iv);
    return fileDecryptedContext;
  }
}
