import 'dart:io';
import 'ai/ai_router.dart';

void main() async {
  final AIRouter router = AIRouter();
  
  print('\n' + '='*40);
  print('   ✨ Beny Romance - Terminal Engine ✨');
  print('       (نسخه نهایی لایه منطق)');
  print('='*40);
  print('💡 راهنما: برای خروج "exit" و برای پاکسازی "clear" بزنید.');
  print('-'*40);

  while (true) {
    stdout.write('\nبهنام: ');
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') {
      print('\nبنجامین: خداحافظ عزیز دلم، منتظر دیدارت هستم... ❤️');
      break;
    }

    if (input.toLowerCase() == 'clear') {
      print('\x1B[2J\x1B[0;0H'); // پاکسازی صفحه ترمینال
      continue;
    }

    if (input.trim().isEmpty) continue;

    // پردازش پیام توسط مغز بنجامین
    String response = router.handleMessage(input);
    
    // شبیه‌سازی تایپ کردن برای حس رمانتیک‌تر
    stdout.write('بنجامین: ');
    for (var char in response.split('')) {
      stdout.write(char);
      await Future.delayed(Duration(milliseconds: 30));
    }
    print('');
  }
}
