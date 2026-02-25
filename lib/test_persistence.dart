import 'ai/ai_memory.dart';
import 'dart:io';

void main() async {
  print("--- Persistence Test ---");
  
  // مرحله 1: اضافه کردن چند پیام و ذخیره آنها
  final memory1 = AIMemory(); // نمونه اول (ذخیره کننده)
  memory1.clear(); // برای اطمینان از پاک بودن شروع می‌کنیم
  print("Memory 1 initialized and cleared.");

  memory1.addMessage("user", "سلام بنجامین، حالت چطوره؟");
  memory1.addMessage("beny", "سلام! من خوبم. تو چطوری؟");
  memory1.addMessage("user", "می‌خوام یه رازی رو بهت بگم...");
  print("Messages added and saved from memory1.");
  
  // مرحله 2: شبیه‌سازی بستن و باز کردن برنامه
  // ما نیازی به این کار نداریم، فقط کافیه یک نمونه جدید از AIMemory بسازیم.
  // اینکار باعث میشه که تاریخچه از فایل خونده بشه.

  // مرحله 3: بررسی اینکه آیا پیام‌ها بازیابی شده‌اند
  final memory2 = AIMemory(); // نمونه دوم (بازیابی کننده)
  print("\nMemory 2 initialized. Attempting to load history...");

  var history = memory2.getHistory();
  print("History from memory2: $history");

  if (history.length == 3 && history.contains("user: سلام بنجامین، حالت چطوره؟")) {
    print("\n✅ Persistence Layer: SUCCESS (Messages survived app restart)");
  } else {
    print("\n❌ Persistence Layer: FAILED");
  }

  // تمیز کردن فایل برای تست‌های بعدی (اختیاری)
  // File('beny_memory.txt').deleteSync(); 
}
