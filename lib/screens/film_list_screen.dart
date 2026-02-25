import 'package:flutter/material.dart';
import '../data/film_data.dart';

class FilmListScreen extends StatelessWidget {
  const FilmListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('فیلم‌ها'), backgroundColor: Colors.pink),
      body: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.movie, color: Colors.pink),
          title: Text(films[index].title),
        ),
      ),
    );
  }
}
