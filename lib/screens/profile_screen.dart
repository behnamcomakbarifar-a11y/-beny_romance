import 'package:flutter/material.dart';
import '../data/music_data.dart';
import '../models/song.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMidnight = Theme.of(context).scaffoldBackgroundColor != const Color(0xFFFFF0F5);
    List<Song> favoriteSongs = songsList.where((s) => s.isFavorite).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          const CircleAvatar(radius: 60, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 80, color: Colors.white)),
          const SizedBox(height: 15),
          const Text("بهنام عزیز", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    const SizedBox(width: 10),
                    Text("آهنگ‌های مورد علاقه من", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                favoriteSongs.isEmpty 
                  ? const Text("هنوز آهنگی را لایک نکرده‌اید.")
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: favoriteSongs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.music_note, color: isMidnight ? const Color(0xFFD4AF37) : Colors.pink),
                          title: Text(favoriteSongs[index].title),
                          subtitle: Text(favoriteSongs[index].artist),
                        );
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
