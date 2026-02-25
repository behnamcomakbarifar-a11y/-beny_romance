import 'security_state.dart';

class SecurityMutator {
  SecurityState _state = SecurityState.normal;

  SecurityState get state => _state;

  void escalate() {
    if (_state == SecurityState.normal) {
      _state = SecurityState.alert;
    } else if (_state == SecurityState.alert) {
      _state = SecurityState.lockdown;
    }
  }

  void reset() {
    _state = SecurityState.normal;
  }
}
