import 'dart:convert';
import 'dart:io';

class SemanticMemory {
  Map<String, String> facts = {};
  final String filePath = 'beny_facts.json';

  SemanticMemory() {
    _loadFacts();
  }

  void _loadFacts() {
    final file = File(filePath);
    if (file.existsSync()) {
      facts = Map<String, String>.from(jsonDecode(file.readAsStringSync()));
    }
  }

  void saveFact(String key, String value) {
    facts[key] = value;
    File(filePath).writeAsStringSync(jsonEncode(facts));
  }

  String? getFact(String key) => facts[key];

  // تشخیص فکت‌های ساده از توی متن
  void extractAndSave(String input) {
    if (input.contains("اسم من")) {
      var name = input.split("اسم من").last.replaceAll("است", "").trim();
      saveFact("user_name", name);
    }
    if (input.contains("علاقه دارم به")) {
      var hobby = input.split("علاقه دارم به").last.trim();
      saveFact("user_hobby", hobby);
    }
  }
}
