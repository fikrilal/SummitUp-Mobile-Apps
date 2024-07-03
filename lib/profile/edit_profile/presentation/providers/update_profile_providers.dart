import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../_core/data/data_sources/api_service_impl.dart';
import '../../data/repositories/edit_profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final apiService = ApiServiceImpl(); // Use the concrete implementation
  return ProfileRepository(apiService);
});

final updateProfileProvider = StateNotifierProvider<UpdateProfileNotifier, bool>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return UpdateProfileNotifier(repository);
});

class UpdateProfileNotifier extends StateNotifier<bool> {
  final ProfileRepository repository;

  UpdateProfileNotifier(this.repository) : super(false);

  Future<void> updateProfile(Map<String, dynamic> data, BuildContext context) async {
    try {
      state = true;
      print('Updating profile with data: $data'); // Logging data
      await repository.updateProfile(data);
      state = false;
      print('Profile updated successfully');
      Navigator.pop(context); // Go back to the previous screen
    } catch (e) {
      state = false;
      print('Error occurred: $e'); // Logging error
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
