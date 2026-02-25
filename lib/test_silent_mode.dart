import 'ai/ai_router.dart';

void main() async {
  // Normal hours test
  print("--- Normal Hours Test ---");
  print(await AIRouter.getResponse("I miss you so much"));

  // Simulate Silent Hours manually
  print("--- Silent Mode Test ---");
  print("🌙 Simulating Silent Hours (00:00 to 05:00)...");
  print(await AIRouter.getResponse("I can’t sleep tonight"));
}
