import 'security/attack_detector.dart';

void main() {
  print(
    AttackDetector.isSuspicious(
      failedAttempts: 0,
      memoryTampered: false,
      runtimeHookDetected: false,
    ),
  ); // false

  print(
    AttackDetector.isSuspicious(
      failedAttempts: 4,
      memoryTampered: false,
      runtimeHookDetected: false,
    ),
  ); // true

  print(
    AttackDetector.isSuspicious(
      failedAttempts: 0,
      memoryTampered: true,
      runtimeHookDetected: false,
    ),
  ); // true

  print(
    AttackDetector.isSuspicious(
      failedAttempts: 0,
      memoryTampered: false,
      runtimeHookDetected: true,
    ),
  ); // true
}
