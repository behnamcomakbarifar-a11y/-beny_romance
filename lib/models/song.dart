class Song {
  final String id;
  final String title;
  final String artist;
  final String albumArt;
  bool isFavorite;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    this.isFavorite = false,
  });
}
