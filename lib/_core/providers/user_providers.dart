import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userProvider = FutureProvider<User>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final id = prefs.getInt('id') ?? 0;
  final username = prefs.getString('username') ?? '';
  final email = prefs.getString('email') ?? '';
  final fullname = prefs.getString('fullname') ?? '';
  final phoneNumber = prefs.getString('phone_number') ?? '';
  final gender = prefs.getString('gender') ?? '';
  final profileImageUrl = prefs.getString('profile_image_url') ?? '';
  return User(id, username, email, fullname, phoneNumber, gender, profileImageUrl);
});

class User {
  final int id;
  final String username;
  final String email;
  final String fullname;
  final String phoneNumber;
  final String gender;
  final String profileImageUrl;

  User(this.id, this.username, this.email, this.fullname, this.phoneNumber, this.gender, this.profileImageUrl);
}
