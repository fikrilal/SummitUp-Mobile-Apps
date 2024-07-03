import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summitup_mobile_apps/_core/presentation/pages/main_screen.dart';
import 'package:summitup_mobile_apps/auth/presentation/pages/login_screen.dart';
import 'package:summitup_mobile_apps/dashboard/presentation/pages/homepage_screen.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/mountain_list_screen.dart';
import 'package:summitup_mobile_apps/payment/presentation/pages/payment_screen.dart';
import 'package:summitup_mobile_apps/payment/presentation/pages/payment_success_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // Load environment variables

  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    ProviderScope(
      child: MyApp(
        initialRoute: isLoggedIn ? '/main' : '/login',
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          initialRoute: initialRoute,
          routes: {
            '/login': (context) => const LoginScreen(),
            '/main': (context) => MainScreen(),
          },
        );
      },
    );
  }
}