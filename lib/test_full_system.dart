import 'ai/beny_personality.dart';
import 'ai/ai_memory.dart';
import 'ai/behavior_rules.dart';

void main() {
  String user = "Behnam";
  String msg1 = "I'm writing a new story tonight.";
  
  print("--- Step 1: Memory Storage ---");
  AIMemory.store(user, msg1);
  print("Stored: ${AIMemory.getHistory(user)}");

  print("\n--- Step 2: Personality Check ---");
  print(BenyPersonality.respond(PersonalityMode.core, msg1));

  print("\n--- Step 3: Intensity Trigger ---");
  String intenseMsg = "I can't live without your voice.";
  print(BenyPersonality.respond(PersonalityMode.core, intenseMsg));
}
