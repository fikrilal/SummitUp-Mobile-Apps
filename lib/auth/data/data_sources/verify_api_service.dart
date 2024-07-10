import '../../../_core/data/data_sources/api_services.dart';
import 'package:http/http.dart' as http;

class VerifyApiService extends ApiService {
  Future<Map<String, dynamic>> verify(String email, String otp) async {
    return await post('verify.php', {'email': email, 'otp': otp});
  }
}