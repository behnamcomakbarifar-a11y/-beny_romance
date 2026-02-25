class AttackDetector {
  static bool isSuspicious({
    required int failedAttempts,
    required bool memoryTampered,
    required bool runtimeHookDetected,
  }) {
    if (runtimeHookDetected) return true;
    if (memoryTampered) return true;
    if (failedAttempts > 3) return true;

    return false;
  }
}
