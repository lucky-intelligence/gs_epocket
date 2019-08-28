import "package:encrypt/encrypt.dart";

class Encrypt {

  static String encryptAES(_text) {
    var key = Key.fromUtf8("0okmnji98uhbvgy76tfcxdr5");
    var iv = IV.fromLength(16);

    var encrypter = Encrypter(AES(key, iv, mode:AESMode.cbc)); 

    return encrypter.encrypt(_text).base64;
  }

  static String decryptAES(_text) {
    var key = Key.fromUtf8("0okmnji98uhbvgy76tfcxdr5");
    var iv = IV.fromLength(16);

    var encrypter = Encrypter(AES(key, iv, mode:AESMode.cbc)); 

    return encrypter.decrypt64(_text);
  }
}