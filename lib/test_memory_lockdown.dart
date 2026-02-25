import 'security/encryption_manager.dart';
import 'security/memory_guard.dart';
import 'security/security_mutator.dart';

void main() {
  final mutator = SecurityMutator();
  final encryption = EncryptionManager();

  final guard = MemoryGuard(encryption.activeKey);

  // وضعیت امن
  assert(guard.validateKey(encryption.activeKey) == true);
  assert(guard.isLocked == false);

  // ورود به lockdown
  mutator.escalate();
  mutator.escalate(); // lockdown
  encryption.onSecurityStateChanged(mutator.state);

  // حافظه قدیمی دیگر معتبر نیست
  assert(guard.validateKey(encryption.activeKey) == false);
  assert(guard.isLocked == true);

  print('✅ Memory locked after encryption mutation');
}
