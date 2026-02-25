class GhostMemory {
  bool _hasLostMemory = false;

  bool get hasLostMemory => _hasLostMemory;

  void markMemoryLost() {
    _hasLostMemory = true;
  }

  String injectFeeling(String response) {
    if (!_hasLostMemory) return response;

    return '$response\n\n…حس می‌کنم یه چیزی رو置 جا گذاشتم، ولی امن‌ترم.';
  }
}
