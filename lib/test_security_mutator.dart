import 'security/security_mutator.dart';

void main() {
  final mutator = SecurityMutator();

  print(mutator.state);
  mutator.escalate();
  print(mutator.state);
  mutator.escalate();
  print(mutator.state);
}
