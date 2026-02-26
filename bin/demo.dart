import 'dart:io';

import 'package:beny_romance/ai/mood_analyzer.dart';
import 'package:beny_romance/ai/ghost_memory.dart';
import 'package:beny_romance/security/attack_detector.dart';
import 'package:beny_romance/ai/behavior_controller.dart';

void main() {
  print('🧠 Beny Romance — Terminal Demo');
  print('Type a message and press Enter:\n');

  final input = stdin.readLineSync();
  if (input == null || input.trim().isEmpty) {
    print('⚠️ Empty input. Abort.');
    return;
  }

  // 1️⃣ Mood
  final moodAnalyzer = MoodAnalyzer();
  final mood = moodAnalyzer.analyze(input);

  // 2️⃣ Security (REAL API)
  final suspicious = AttackDetector.isSuspicious(
    failedAttempts: 0,
    memoryTampered: false,
    runtimeHookDetected: false,
  );

  // 3️⃣ Core objects existence (Smoke)
  final behaviorController = BehaviorController();
  final ghostMemory = GhostMemory();

  // 🖥️ Output
  print('\n──────── RESULT ────────');
  print('Input       : $input');
  print('Mood        : $mood');
  print('Suspicious  : $suspicious');
  print('BehaviorCtl : ✅ loaded');
  print('GhostMemory : ✅ loaded');
  print('────────────────────────');
}
