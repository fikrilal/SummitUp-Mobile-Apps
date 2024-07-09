import '../../../_core/data/data_sources/api_services.dart';
import 'package:http/http.dart' as http;

class RegisterApiService extends ApiService {
  Future<Map<String, dynamic>> register(String username, String email, String password, String fullname, String phoneNumber) async {
    return await post('register.php', {
      'username': username,
      'email': email,
      'password': password,
      'fullname': fullname,
      'phone_number': phoneNumber,
    });
  }
}
