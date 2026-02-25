class KillSwitch {
  static bool _triggered = false;
  
  // تعریف به صورت getter برای دسترسی راحت‌تر
  bool get isTriggered => _triggered;

  static void trigger() {
    _triggered = true;
    print("⚠️ KillSwitch Activated!");
  }

  static void reset() {
    _triggered = false;
    print("✅ KillSwitch Reset.");
  }
}
