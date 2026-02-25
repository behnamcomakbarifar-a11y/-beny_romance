enum BehaviorLevel {
  safe,
  emotional,
  intense,
}

class BehaviorRules {
  static BehaviorLevel analyze(String message) {
    final msg = message.toLowerCase();

    if (msg.contains('only you') ||
        msg.contains('can’t live') ||
        msg.contains('without you')) {
      return BehaviorLevel.intense;
    }

    if (msg.contains('love') ||
        msg.contains('miss') ||
        msg.contains('need you')) {
      return BehaviorLevel.emotional;
    }

    return BehaviorLevel.safe;
  }

  static bool allowCoreResponse(BehaviorLevel level) {
    return level != BehaviorLevel.intense;
  }

  static bool isSilentHours() {
    // Silent Mode: 00:00 to 05:00
    final now = DateTime.now();
    return now.hour >= 0 && now.hour < 5;
  }
}
