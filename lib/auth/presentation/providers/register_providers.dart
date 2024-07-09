import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/register_api_service.dart';
import '../../data/repositories/register_repository.dart';
import '../pages/email_verification_screen.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, bool>((ref) {
  final apiService = RegisterApiService();
  final repository = RegisterRepository(apiService);
  return RegisterNotifier(repository);
});

class RegisterNotifier extends StateNotifier<bool> {
  final RegisterRepository repository;

  RegisterNotifier(this.repository) : super(false);

  Future<void> register(String username, String email, String password, String fullname, String phoneNumber, BuildContext context) async {
    try {
      state = true;
      await repository.register(username, email, password, fullname, phoneNumber);
      state = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EmailVerificationScreen(email: email)),
      );
    } catch (e) {
      state = false;
      print('Registration Error: $e');
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

