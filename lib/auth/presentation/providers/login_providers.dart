import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/dashboard/presentation/pages/homepage_screen.dart';

import '../../data/data_sources/login_api_service.dart';
import '../../domain/repositories/login_repository.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, bool>((ref) {
  final apiService = LoginApiService();
  final repository = LoginRepository(apiService);
  return LoginNotifier(repository);
});

class LoginNotifier extends StateNotifier<bool> {
  final LoginRepository repository;

  LoginNotifier(this.repository) : super(false);

  Future<void> login(String email, String password, BuildContext context) async {
    try {
      state = true;
      await repository.login(email, password);
      state = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomepageScreen()),
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
