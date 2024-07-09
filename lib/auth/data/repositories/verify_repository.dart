import '../data_sources/verify_api_service.dart';

class VerifyRepository {
  final VerifyApiService apiService;

  VerifyRepository(this.apiService);

  Future<void> verify(String email, String otp) async {
    final response = await apiService.verify(email, otp);
    if (response['message'] != 'Verification successful.') {
      throw Exception(response['message']);
    }
  }
}
