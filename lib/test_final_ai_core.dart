import 'ai/ai_router.dart';

void main() {
  final ai = AIRouter();

  // حالت عادی
  var response = ai.respond('دلم گرفته');
  assert(response.contains('آروم'));

  // شبیه‌سازی حمله
  ai.security.escalate();
  ai.security.escalate(); // lockdown

  response = ai.respond('نمی‌دونم چی شد');
  assert(response.contains('احتیاط') || response.contains('حس می‌کنم'));

  print('✅ Final AI core wired successfully');
}
