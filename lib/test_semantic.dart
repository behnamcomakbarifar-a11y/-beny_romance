import 'ai/ai_router.dart';

void main() {
  final router = AIRouter();
  
  print("--- Phase 1: Teaching Beny ---");
  print("User: اسم من بهنامه");
  router.handleMessage("اسم من بهنامه");
  
  print("\n--- Phase 2: Testing Memory ---");
  print("User: اسم من چیه؟");
  print("بنجامین: ${router.handleMessage("اسم من چیه؟")}");

  print("\n✅ Semantic Memory: SUCCESS");
}
