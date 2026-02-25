import 'mental_state.dart';

class BehaviorController {
  MentalState _state = MentalState.normal;

  MentalState get state => _state;

  void enterGuardedMode() {
    _state = MentalState.guarded;
  }

  String filterResponse(String input) {
    if (_state == MentalState.guarded) {
      return _soften(input);
    }
    return input;
  }

  String _soften(String text) {
    return '… $text\n(با احتیاط پاسخ می‌دم)';
  }
}
