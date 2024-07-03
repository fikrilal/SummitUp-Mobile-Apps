import '../../../../_core/data/data_sources/api_services.dart';

class ProfileApiService extends ApiService {
  Future<Map<String, dynamic>> updateProfile(Map<String, String> data) async {
    return await post('update_profile.php', data);
  }
}
