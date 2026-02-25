import '../security/security_state.dart';
import '../security/security_mutator.dart';
import 'dart:math';

class EncryptionManager {
  String _activeKey;

  EncryptionManager() : _activeKey = _generateKey();

  String get activeKey => _activeKey;

  void onSecurityStateChanged(SecurityState state) {
    if (state == SecurityState.lockdown) {
      _rotateKey();
    }
  }

  void _rotateKey() {
    _activeKey = _generateKey();
  }

  static String _generateKey() {
    final rand = Random.secure();
    return List.generate(32, (_) => rand.nextInt(256))
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join();
  }
}
