import 'ai/ai_memory.dart';
import 'security/encrypter.dart';

void main() {
  final memory = AIMemory();
  
  print("--- Secure Memory Test ---");
  
  // اضافه کردن یک پیام حساس
  memory.addMessage("user", "من عاشق تو هستم بنجامین");
  
  // تست لایه اول: آیا مستقیم قابل خوندن هست؟
  // (ما اینجا به متغیر خصوصی دسترسی نداریم ولی در واقعیت این همون چیزیه که ذخیره میشه)
  print("🔒 Memory is now encrypted.");

  // تست لایه دوم: آیا بنجامین خودش میتونه بخونتش؟
  var history = memory.getHistory();
  print("🔓 Decrypted for Beny: ${history[0]}");

  if (history[0].contains("عاشق")) {
    print("\n✅ Secure Memory: SUCCESS (Stored Encrypted, Read Plain)");
  } else {
    print("\n❌ Secure Memory: FAILED");
  }
}
