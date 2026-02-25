class MoodAnalyzer {
  String analyze(String input) {
    final text = input.toLowerCase();

    if (text.contains('دوستت دارم') || text.contains('love')) {
      return 'romantic';
    }

    if (text.contains('خسته') || text.contains('sad')) {
      return 'sad';
    }

    if (text.contains('خوشحال') || text.contains('happy')) {
      return 'happy';
    }

    return 'neutral';
  }
}
