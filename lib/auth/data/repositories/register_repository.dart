import '../data_sources/register_api_service.dart';

class RegisterRepository {
  final RegisterApiService apiService;

  RegisterRepository(this.apiService);

  Future<void> register(String username, String email, String password, String fullname, String phoneNumber) async {
    final response = await apiService.register(username, email, password, fullname, phoneNumber);
    if (response['message'] == 'User registered successfully. Verification code sent to email.') {
      // Simpan data yang diperlukan untuk verifikasi email di shared preferences atau state management
    } else {
      throw Exception(response['message']);
    }
  }
}
