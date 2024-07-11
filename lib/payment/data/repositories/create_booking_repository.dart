import '../models/create_booking_api_service.dart';

class CreateBookingRepository {
  final CreateBookingApiService apiService;

  CreateBookingRepository(this.apiService);

  Future<int> createBooking(Map<String, String> data) async {
    final response = await apiService.createBooking(data);
    if (response['message'] != 'Booking created successfully.') {
      throw Exception(response['message']);
    }
    return response['booking_id'];
  }
}
