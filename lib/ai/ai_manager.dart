import '../security/security_monitor.dart';
import '../security/kill_switch.dart';

enum AIType {
  support,
  core,
}

class AIManager {
  static Future<AIType> getActiveAI() async {
    final isSecure = await SecurityMonitor.isSecure();
    final killActive = await KillSwitch.isActive();

    if (isSecure && !killActive) {
      return AIType.core;
    }
    return AIType.support;
  }

  static Future<bool> canUseCoreAI() async {
    return await getActiveAI() == AIType.core;
  }
}
