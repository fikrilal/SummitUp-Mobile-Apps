import '../../../../_core/data/data_sources/api_services.dart';

class CreateBookingApiService extends ApiService {
  Future<Map<String, dynamic>> createBooking(Map<String, String> data) async {
    return await post('create_booking.php', data);
  }
}
