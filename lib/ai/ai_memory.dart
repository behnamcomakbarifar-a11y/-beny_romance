import 'dart:io';
import '../security/encrypter.dart';

class AIMemory {
  final List<String> _history = [];
  final int maxMessages = 5;
  final String _filePath = 'beny_memory.txt'; // فایلی که خاطرات Beny اینجا ذخیره میشه

  AIMemory() {
    _loadHistory(); // وقتی کلاس ساخته میشه، خاطرات رو بارگذاری کن
  }

  void _loadHistory() {
    final file = File(_filePath);
    if (file.existsSync()) {
      try {
        List<String> encryptedLines = file.readAsLinesSync();
        _history.addAll(encryptedLines.where((line) => line.isNotEmpty));
        print("Beny's memory loaded successfully.");
      } catch (e) {
        print("Error loading Beny's memory: $e");
        _history.clear(); // اگر خطایی در بارگذاری بود، حافظه را پاک کن
      }
    }
  }

  void _saveHistory() {
    final file = File(_filePath);
    try {
      file.writeAsStringSync(_history.join('\n'));
      print("Beny's memory saved successfully.");
    } catch (e) {
      print("Error saving Beny's memory: $e");
    }
  }

  void addMessage(String role, String message) {
    if (_history.length >= maxMessages) {
      _history.removeAt(0);
    }
    String secureEntry = BenyEncrypt.encode("$role: $message");
    _history.add(secureEntry);
    _saveHistory(); // بعد از هر پیام، حافظه رو ذخیره کن
  }

  List<String> getHistory() {
    return _history.map((encrypted) => BenyEncrypt.decode(encrypted)).toList();
  }

  void clear() {
    _history.clear();
    _saveHistory(); // بعد از پاک کردن، حافظه رو هم ذخیره کن (تا فایل پاک بشه)
  }
}
