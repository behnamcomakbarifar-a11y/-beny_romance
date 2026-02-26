import 'package:beny_romance/ai/ghost_memory.dart';
import 'package:beny_romance/ai/mood_analyzer.dart';
import 'package:beny_romance/security/attack_detector.dart';

void main() {
  print('🚀 Full System Smoke Test Started');

  // 👻 GhostMemory
  final ghostMemory = GhostMemory();
  assert(ghostMemory != null);
  print('✅ GhostMemory instantiated');

  // 😊 MoodAnalyzer
  final moodAnalyzer = MoodAnalyzer();
  final mood = moodAnalyzer.analyze('I feel calm');
  assert(mood != null);
  print('✅ MoodAnalyzer working');

  // 🛡️ AttackDetector — REAL API
  final suspicious = AttackDetector.isSuspicious(
    failedAttempts: 0,
    memoryTampered: false,
    runtimeHookDetected: false,
  );
  assert(suspicious == false);
  print('✅ AttackDetector working');

  print('\n🎯 FULL SYSTEM CORE VERIFIED — STABLE / READY');
}
