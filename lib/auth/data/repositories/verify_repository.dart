import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user_entity.dart';
import '../data_sources/verify_api_service.dart';

class VerifyRepository {
  final VerifyApiService apiService;

  VerifyRepository(this.apiService);

  Future<void> verify(String email, String otp) async {
    final response = await apiService.verify(email, otp);
    if (response['message'] != 'Verification successful.') {
      throw Exception(response['message']);
    }

    final user = User.fromJson(response);
    await _saveUserToSharedPreferences(user);
  }

  Future<void> _saveUserToSharedPreferences(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', user.id);
    prefs.setString('username', user.username);
    prefs.setString('email', user.email);
    prefs.setString('fullname', user.fullname);
    prefs.setString('phone_number', user.phoneNumber);
    prefs.setString('gender', user.gender);
    prefs.setString('profile_image_url', user.profileImageUrl);
    prefs.setBool('isLoggedIn', true);
  }
}