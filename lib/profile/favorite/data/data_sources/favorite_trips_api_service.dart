import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../_core/data/data_sources/api_services.dart';

class FavouriteTripsApiService extends ApiService {
  Future<List<dynamic>> fetchFavouriteTrips(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/get_favorite_trips.php?user_id=$userId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load favourite trips');
    }
  }

  Future<void> deleteFavouriteTrip(int favouriteId) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/delete_favourite_trip.php?favourite_id=$favouriteId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete favourite trip');
    }
  }

  Future<void> addFavouriteTrip(int userId, int tripId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_favourite_trip.php'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'user_id': userId, 'trip_id': tripId}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add favourite trip');
    }
  }
}
