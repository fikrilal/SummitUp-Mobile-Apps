import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:summitup_mobile_apps/_core/presentation/pages/main_screen.dart';
import 'package:summitup_mobile_apps/auth/presentation/pages/login_screen.dart';
import 'package:summitup_mobile_apps/dashboard/presentation/pages/homepage_screen.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/mountain_list_screen.dart';
import 'package:summitup_mobile_apps/payment/presentation/pages/payment_screen.dart';
import 'package:summitup_mobile_apps/payment/presentation/pages/payment_success_screen.dart';

Future main() async {
  await dotenv.load(); // Load environment variables
  runApp(const ProviderScope(child: MyApp()));
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          home: LoginScreen(),
        );
      },
    );
  }
}