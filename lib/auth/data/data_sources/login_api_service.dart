import '../../../_core/data/data_sources/api_services.dart';
import 'package:http/http.dart' as http;

class LoginApiService extends ApiService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    return await post('signin.php', {'email': email, 'password': password});
  }
}