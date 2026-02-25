import 'security/security_mutator.dart';
import 'security/security_state.dart';
import 'security/encryption_manager.dart';

void main() {
  final mutator = SecurityMutator();
  final manager = EncryptionManager();

  final initialKey = manager.activeKey;

  mutator.escalate(); // alert
  manager.onSecurityStateChanged(mutator.state);
  assert(manager.activeKey == initialKey);

  mutator.escalate(); // lockdown
  manager.onSecurityStateChanged(mutator.state);
  assert(manager.activeKey != initialKey);

  print('✅ Encryption key rotated on lockdown');
}
