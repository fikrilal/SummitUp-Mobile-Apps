class User {
  final int id;
  final String username;
  final String email;
  final String fullname;
  final String phoneNumber;
  final String profileImageUrl;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.fullname,
    required this.phoneNumber,
    required this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      fullname: json['fullname'],
      phoneNumber: json['phone_number'],
      profileImageUrl: json['profile_image_url'],
    );
  }
}
