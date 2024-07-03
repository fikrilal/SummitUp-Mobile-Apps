import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/login_api_service.dart';
import '../../domain/entities/user_entity.dart';

class LoginRepository {
  final LoginApiService apiService;

  LoginRepository(this.apiService);

  Future<User> login(String email, String password) async {
    final response = await apiService.login(email, password);
    if (response['message'] == 'Login successful.') {
      final user = User.fromJson(response['user']);
      await _saveUserToSharedPreferences(user);
      return user;
    } else {
      throw Exception(response['message']);
    }
  }

  Future<void> _saveUserToSharedPreferences(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', user.id);
    prefs.setString('username', user.username);
    prefs.setString('email', user.email);
    prefs.setString('fullname', user.fullname);
    prefs.setString('phone_number', user.phoneNumber);
    prefs.setString('profile_image_url', user.profileImageUrl);
  }
}

