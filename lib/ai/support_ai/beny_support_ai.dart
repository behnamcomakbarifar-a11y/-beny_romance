class BenySupportAI {
  static const String name = 'Beny Support AI';

  static String respond(String input) {
    return _basicResponse(input);
  }

  static String _basicResponse(String input) {
    final text = input.toLowerCase();

    if (text.contains('help')) {
      return 'I am here to help. You can ask about app features or navigation.';
    }

    if (text.contains('error')) {
      return 'If something is not working, try restarting the app or checking your connection.';
    }

    if (text.contains('ai')) {
      return 'Advanced AI features are currently unavailable in this mode.';
    }

    return 'I am available, but my capabilities are limited for security reasons.';
  }
}
