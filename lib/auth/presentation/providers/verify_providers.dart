import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../_core/presentation/pages/main_screen.dart';
import '../../data/data_sources/verify_api_service.dart';
import '../../data/repositories/verify_repository.dart';

final verifyProvider = StateNotifierProvider<VerifyNotifier, bool>((ref) {
  final apiService = VerifyApiService();
  final repository = VerifyRepository(apiService);
  return VerifyNotifier(repository);
});

class VerifyNotifier extends StateNotifier<bool> {
  final VerifyRepository repository;

  VerifyNotifier(this.repository) : super(false);

  Future<void> verify(String email, String otp, BuildContext context) async {
    try {
      state = true;
      await repository.verify(email, otp);
      state = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
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
