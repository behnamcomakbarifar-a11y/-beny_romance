import 'security/security_mutator.dart';
import 'security/encryption_manager.dart';
import 'security/memory_guard.dart';
import 'ai/ghost_memory.dart';

void main() {
  final mutator = SecurityMutator();
  final encryption = EncryptionManager();
  final guard = MemoryGuard(encryption.activeKey);
  final ghost = GhostMemory();

  // حالت عادی
  var response = ghost.injectFeeling('کنارت هستم');
  assert(!response.contains('حس می‌کنم'));

  // ورود به lockdown
  mutator.escalate();
  mutator.escalate();
  encryption.onSecurityStateChanged(mutator.state);

  final valid = guard.validateKey(encryption.activeKey);
  if (!valid) {
    ghost.markMemoryLost();
  }

  assert(ghost.hasLostMemory == true);

  response = ghost.injectFeeling('هنوز حواسم بهته');
  assert(response.contains('حس می‌کنم'));

  print('✅ Ghost memory activated after lockdown');
}
