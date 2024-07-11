import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/create_booking_api_service.dart';
import '../../data/repositories/create_booking_repository.dart';

class CreateBookingNotifier extends StateNotifier<bool> {
  final CreateBookingRepository repository;

  CreateBookingNotifier(this.repository) : super(false);

  Future<void> createBooking(Map<String, String> data, BuildContext context) async {
    try {
      state = true;
      final bookingId = await repository.createBooking(data);
      state = false;
      Navigator.pop(context, bookingId); // Go back to the previous screen and pass the booking ID
    } catch (e) {
      state = false;
      _showErrorMessage(context, e.toString());
    }
  }

  void _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

final createBookingApiServiceProvider = Provider<CreateBookingApiService>((ref) {
  return CreateBookingApiService();
});

final createBookingRepositoryProvider = Provider<CreateBookingRepository>((ref) {
  final apiService = ref.watch(createBookingApiServiceProvider);
  return CreateBookingRepository(apiService);
});

final createBookingProvider = StateNotifierProvider<CreateBookingNotifier, bool>((ref) {
  final repository = ref.watch(createBookingRepositoryProvider);
  return CreateBookingNotifier(repository);
});
