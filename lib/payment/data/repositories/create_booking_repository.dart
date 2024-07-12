import '../models/create_booking_api_service.dart';

class CreateBookingRepository {
  final CreateBookingApiService apiService;

  CreateBookingRepository(this.apiService);

  Future<int?> createBooking(Map<String, String> data) async {
    final response = await apiService.createBooking(data);
    if (response['message'] == 'Booking created successfully.') {
      return response['booking_id'];
    } else {
      throw Exception(response['message']);
    }
  }
}