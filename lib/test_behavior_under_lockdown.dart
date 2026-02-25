import 'security/encryption_manager.dart';
import 'security/memory_guard.dart';
import 'security/security_mutator.dart';
import 'ai/behavior_controller.dart';
import 'ai/mental_state.dart';

void main() {
  final mutator = SecurityMutator();
  final encryption = EncryptionManager();
  final guard = MemoryGuard(encryption.activeKey);
  final behavior = BehaviorController();

  // حالت عادی
  var response = behavior.filterResponse('دوست دارم کنارتم');
  assert(!response.contains('احتیاط'));

  // ورود به lockdown
  mutator.escalate();
  mutator.escalate();
  encryption.onSecurityStateChanged(mutator.state);

  final valid = guard.validateKey(encryption.activeKey);
  if (!valid) {
    behavior.enterGuardedMode();
  }

  assert(behavior.state == MentalState.guarded);

  response = behavior.filterResponse('نمی‌خوام از دستت بدم');
  assert(response.contains('احتیاط'));

  print('✅ Behavior adapted after memory lockdown');
}
