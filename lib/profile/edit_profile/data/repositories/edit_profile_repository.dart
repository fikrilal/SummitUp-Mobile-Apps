import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../_core/data/data_sources/api_service_impl.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository(this.apiService);

  Future<void> updateProfile(Map<String, dynamic> data) async {
    try {
      print("Sending data: $data"); // Print data being sent
      final response = await apiService.post('update_profile.php', data);
      print("Response received: $response"); // Print response received

      if (response['message'] != 'User profile updated successfully.') {
        throw Exception(response['message']);
      }

      print("Updating SharedPreferences");
      // Update shared preferences
      await _updateSharedPreferences(data);
      print("SharedPreferences updated successfully");
    } catch (e) {
      print("Error occurred in repository: $e"); // Print any error that occurs
      throw Exception('Failed to load data from repository');
    }
  }

  Future<void> _updateSharedPreferences(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    print("SharedPreferences instance obtained");
    prefs.setString('username', data['username'] ?? '');
    prefs.setString('fullname', data['fullname'] ?? '');
    prefs.setString('email', data['email'] ?? '');
    prefs.setString('phone_number', data['phone_number'] ?? '');
    prefs.setString('profile_image_url', data['profile_image_url'] ?? '');
    print("Data saved to SharedPreferences");
  }
}
