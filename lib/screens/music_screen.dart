import 'package:flutter/material.dart';
import '../models/song.dart';
import '../data/music_data.dart';
import '../widgets/comment_widget.dart';
import '../models/comment.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  // فرض می‌کنیم آهنگ اول در حال پخش است
  Song currentSong = songsList[0];
  final List<Comment> _comments = [];
  final TextEditingController _commentController = TextEditingController();

  void _toggleFavorite() {
    setState(() {
      currentSong.isFavorite = !currentSong.isFavorite;
    });
    // اینجا یک پیام کوچک (SnackBar) هم نشان می‌دهیم
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(currentSong.isFavorite ? "به علاقه‌مندی‌ها اضافه شد" : "از علاقه‌مندی‌ها حذف شد"),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMidnight = Theme.of(context).scaffoldBackgroundColor != const Color(0xFFFFF0F5);

    return Column(
      children: [
        const SizedBox(height: 60),
        // بخش کاور آهنگ و دکمه لایک
        Stack(
          alignment: Alignment.bottomRight,
          chilcat << 'EOF' > lib/security/kill_switch.dart
          class KillSwitch {
            static bool _triggered = false;
              static bool get isTriggered => _triggered;
                static void trigger() {
                    _triggered = true;
                        print("⚠️ KillSwitch triggered");
                          }
                            static void reset() {
                                _triggered = false;
                                    print("✅ KillSwitch reset");
                                      }
                                      }
                                      EOF
                                      dren: [
            Container(
              width: 250, height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                color: isMidnight ? const Color(0xFF1A2634) : Colors.pink[100],
              ),
              child: Icon(Icons.music_note, size: 120, color: isMidnight ? const Color(0xFFD4AF37) : Colors.pink),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.white.withOpacity(0.8),
                child: Icon(
                  currentSong.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: _toggleFavorite,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(currentSong.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isMidnight ? Colors.white : Colors.black87)),
        Text(currentSong.artist, style: TextStyle(fontSize: 16, color: isMidnight ? const Color(0xFFD4AF37) : Colors.pink)),
        
        const Divider(height: 40),
        const Text("نظرات کاربران", style: TextStyle(fontWeight: FontWeight.bold)),
        // بخش کامنت‌ها که قبلاً ساختیم...
        Expanded(
          child: _comments.isEmpty 
            ? Center(child: Text("هنوز نظری ثبت نشده است", style: TextStyle(color: Colors.grey)))
            : ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) => CommentWidget(comment: _comments[index], isMidnight: isMidnight),
              ),
        ),
        // ... (بخش TextField ارسال کامنت مشابه قبل)
      ],
    );
  }
}
