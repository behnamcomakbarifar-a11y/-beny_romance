import 'security/security_mutator.dart';
import 'security/security_state.dart';

void main() {
  final mutator = SecurityMutator();

  assert(mutator.state == SecurityState.normal);

  mutator.escalate();
  assert(mutator.state == SecurityState.alert);

  mutator.escalate();
  assert(mutator.state == SecurityState.lockdown);

  mutator.reset();
  assert(mutator.state == SecurityState.normal);

  print('✅ Security state flow OK');
}
