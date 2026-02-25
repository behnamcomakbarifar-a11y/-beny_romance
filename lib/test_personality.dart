import 'ai/beny_personality.dart';

void main() {
  print(BenyPersonality.respond(PersonalityMode.core, "I miss you"));
  print(BenyPersonality.respond(PersonalityMode.core, "I feel lonely"));
  print(BenyPersonality.respond(PersonalityMode.support, "Hello"));
}
