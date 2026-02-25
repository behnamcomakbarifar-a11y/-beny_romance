import '../../security/security_monitor.dart';
import '../../security/kill_switch.dart';

class BenyAICore {
  static const String name = 'Beny AI Core';
  static const String slogan = 'Your Midnight Companion';

  /// اجرای دستور در حالت امن
  static Future<String> respond(String input) async {
    final isSecure = await SecurityMonitor.isSecure();
    final killActive = await KillSwitch.isActive();

    if (!isSecure || killActive) {
      return 'Core AI is unavailable due to security restrictions.';
    }

    return _advancedResponse(input);
  }

  /// پاسخ شبیه ChatGPT / Romance Mode
  static String _advancedResponse(String input) {
    final text = input.toLowerCase();

    // حالت رومنس
    if (text.contains('romance') || text.contains('love')) {
      return 'Under the midnight skies, I stand by you — your loyal companion.';
    }

    // حالت چت آزاد
    if (text.contains('hello')) {
      return 'Hello! I am your Midnight Companion, ready to assist.';
    }

    // حالت برنامه‌نویسی / کمک فنی
    if (text.contains('code') || text.contains('flutter')) {
      return 'I can help you create and debug Flutter code — tell me what you need.';
    }

    // حالت عمومی
    return 'Tell me your thoughts, and I will respond with depth and clarity.';
  }
}
