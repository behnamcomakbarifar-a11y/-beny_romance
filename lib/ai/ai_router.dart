import 'mood_analyzer.dart';
import 'semantic_memory.dart';
import 'behavior_controller.dart';
import 'ghost_memory.dart';
import '../security/security_mutator.dart';
import '../security/encryption_manager.dart';
import '../security/memory_guard.dart';

class AIRouter {
  final MoodAnalyzer moodAnalyzer = MoodAnalyzer();
  final SemanticMemory semanticMemory = SemanticMemory();
  final BehaviorController behavior = BehaviorController();
  final GhostMemory ghost = GhostMemory();

  final SecurityMutator security = SecurityMutator();
  final EncryptionManager encryption = EncryptionManager();
  late final MemoryGuard guard;

  AIRouter() {
    guard = MemoryGuard(encryption.activeKey);
  }

  String respond(String input) {
    final detectedMood = moodAnalyzer.analyze(input);

    encryption.onSecurityStateChanged(security.state);
    final memoryValid = guard.validateKey(encryption.activeKey);

    if (!memoryValid) {
      behavior.enterGuardedMode();
      ghost.markMemoryLost();
    }

    var response = _baseResponse(input, detectedMood);
    response = behavior.filterResponse(response);
    response = ghost.injectFeeling(response);

    return response;
  }

  String _baseResponse(String input, String mood) {
    if (mood == 'sad') return 'اینجام، آروم باش.';
    if (mood == 'romantic') return 'احساست برام مهمه.';
    return 'گوش می‌دم.';
  }
}
