import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/auth/presentation/email_verification_screen.dart';
import 'package:summitup_mobile_apps/auth/presentation/register_screen.dart';
import 'package:summitup_mobile_apps/auth/presentation/register_success.dart';
import 'package:summitup_mobile_apps/jelajah/presentation/mountain_details_screen.dart';

import 'auth/presentation/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          home: MountainDetailsScreen(),
        );
      },
    );
  }
}