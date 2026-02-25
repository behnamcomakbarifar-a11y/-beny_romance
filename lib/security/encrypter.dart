import 'dart:convert';

class BenyEncrypt {
  // این یک کلید فرضی برای رمزنگاریه
  static const String _key = "BENY_ROMANCE_SECRET_2026";

  static String encode(String text) {
    // تبدیل متن به کد Base64 (برای امنیت لایه اول در منطق)
    var bytes = utf8.encode(text);
    return base64.encode(bytes);
  }

  static String decode(String encryptedText) {
    var bytes = base64.decode(encryptedText);
    return utf8.decode(bytes);
  }
}
