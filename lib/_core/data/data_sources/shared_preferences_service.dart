import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  Future<void> saveUser(Map<String, dynamic> user) async {
    await _preferences.setInt('id', user['id']);
    await _preferences.setString('username', user['username']);
    await _preferences.setString('email', user['email']);
    await _preferences.setString('fullname', user['fullname']);
    await _preferences.setString('phone_number', user['phone_number']);
    await _preferences.setString('profile_image_url', user['profile_image_url']);
    await _preferences.setString('created_at', user['created_at']);
  }

  Map<String, dynamic>? getUser() {
    int? id = _preferences.getInt('id');
    String? username = _preferences.getString('username');
    String? email = _preferences.getString('email');
    String? fullname = _preferences.getString('fullname');
    String? phoneNumber = _preferences.getString('phone_number');
    String? profileImageUrl = _preferences.getString('profile_image_url');
    String? createdAt = _preferences.getString('created_at');

    if (id != null && username != null && email != null) {
      return {
        'id': id,
        'username': username,
        'email': email,
        'fullname': fullname,
        'phone_number': phoneNumber,
        'profile_image_url': profileImageUrl,
        'created_at': createdAt,
      };
    }
    return null;
  }

  Future<void> clearUser() async {
    await _preferences.clear();
  }
}