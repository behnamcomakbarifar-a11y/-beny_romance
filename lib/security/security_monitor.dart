import 'dart:io';

class SecurityMonitor {
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;

  /// تشخیص امولاتور
  static Future<bool> isEmulator() async {
    if (isAndroid) {
      return await _checkAndroidEmulator();
    }
    if (isIOS) {
      return await _checkIOSEmulator();
    }
    return false;
  }

  /// تشخیص Root / Jailbreak
  static Future<bool> isCompromised() async {
    if (isAndroid) {
      return await _checkAndroidRoot();
    }
    if (isIOS) {
      return await _checkIOSJailbreak();
    }
    return false;
  }

  /// وضعیت کلی امنیت
  static Future<bool> isSecure() async {
    final emulator = await isEmulator();
    final compromised = await isCompromised();
    return !emulator && !compromised;
  }

  // ---------- ANDROID ----------

  static Future<bool> _checkAndroidEmulator() async {
    const indicators = [
      'generic',
      'sdk',
      'emulator',
      'x86',
      'goldfish',
    ];
    final fingerprint = Platform.environment['ANDROID_FINGERPRINT'] ?? '';
    return indicators.any((e) => fingerprint.contains(e));
  }

  static Future<bool> _checkAndroidRoot() async {
    const paths = [
      '/system/app/Superuser.apk',
      '/system/xbin/su',
      '/system/bin/su',
      '/sbin/su',
      '/vendor/bin/su',
    ];

    for (final path in paths) {
      if (File(path).existsSync()) {
        return true;
      }
    }
    return false;
  }

  // ---------- IOS ----------

  static Future<bool> _checkIOSEmulator() async {
    return Platform.environment.containsKey('SIMULATOR_DEVICE_NAME');
  }

  static Future<bool> _checkIOSJailbreak() async {
    const paths = [
      '/Applications/Cydia.app',
      '/Library/MobileSubstrate/MobileSubstrate.dylib',
      '/bin/bash',
      '/usr/sbin/sshd',
      '/etc/apt',
    ];

    for (final path in paths) {
      if (File(path).existsSync()) {
        return true;
      }
    }
    return false;
  }
}
