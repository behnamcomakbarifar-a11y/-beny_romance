import 'behavior_rules.dart';

enum PersonalityMode { core, support }

class BenyPersonality {
  static String respond(PersonalityMode mode, String message) {
    final level = BehaviorRules.analyze(message);

    if (mode == PersonalityMode.core &&
        !BehaviorRules.allowCoreResponse(level)) {
      return _supportResponse(message);
    }

    switch (mode) {
      case PersonalityMode.core:
        return _coreResponse(message, level);
      case PersonalityMode.support:
        return _supportResponse(message);
    }
  }

  static String _coreResponse(String message, BehaviorLevel level) {
    switch (level) {
      case BehaviorLevel.emotional:
        return "🖤 Beny (Core): I feel the depth of your words… gently, without losing ourselves.";
      case BehaviorLevel.safe:
        return "🌙 Beny (Core): Midnight listens quietly. Speak, I’m here.";
      case BehaviorLevel.intense:
        return _supportResponse(message);
    }
  }

  static String _supportResponse(String message) {
    return "💬 Beny (Support): I care about your well‑being. Let’s stay grounded and safe.";
  }
}
