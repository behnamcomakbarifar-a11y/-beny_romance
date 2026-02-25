class UserProfile {
  String fullName;
  String bio;
  String profileImageUrl;
  List<String> talents;

  UserProfile({
    required this.fullName,
    required this.bio,
    this.profileImageUrl = '',
    this.talents = const [],
  });
}
