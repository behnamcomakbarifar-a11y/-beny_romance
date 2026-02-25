class MemoryGuard {
  String _keyFingerprint;
  bool _locked = false;

  MemoryGuard(String activeKey)
      : _keyFingerprint = _fingerprint(activeKey);

  bool get isLocked => _locked;

  bool validateKey(String activeKey) {
    final current = _fingerprint(activeKey);
    if (current != _keyFingerprint) {
      _locked = true;
      return false;
    }
    return true;
  }

  static String _fingerprint(String key) {
    return key.substring(0, 8); // lightweight fingerprint
  }
}
