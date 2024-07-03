import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../_core/presentation/pages/main_screen.dart';
import '../../data/data_sources/login_api_service.dart';
import '../../data/repositories/login_repository.dart';

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
      state = true;  // set loading state
      final user = await repository.login(email, password);
      state = false; // reset loading state

      // Save login state and user data to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('user', user.toString()); // Save user data as needed

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } catch (e) {
      state = false;  // reset loading state
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

  // This can be called to log out the user
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('user');

    Navigator.pushReplacementNamed(context, '/login');
  }
}