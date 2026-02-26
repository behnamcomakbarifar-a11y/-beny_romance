import 'package:beny_romance/ai/adaptive_behavior.dart';

void main() {
  final adaptive = AdaptiveBehavior();

  final state1 = adaptive.decide(
    mood: 'happy',
    suspicious: false,
  );

  final state2 = adaptive.decide(
    mood: 'angry',
    suspicious: false,
  );

  final state3 = adaptive.decide(
    mood: 'neutral',
    suspicious: true,
  );

  print('happy + safe   => $state1');
  print('angry + safe   => $state2');
  print('any + threat  => $state3');
}
