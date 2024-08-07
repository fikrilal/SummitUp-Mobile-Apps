import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summitup_mobile_apps/_core/presentation/pages/main_screen.dart';
import 'package:summitup_mobile_apps/auth/presentation/pages/login_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:summitup_mobile_apps/auth/presentation/pages/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initializeDateFormatting('id_ID', null);
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    ProviderScope(
      overrides: [
        midtransProvider.overrideWithValue(await _initMidtrans()),
      ],
      child: MyApp(
        initialRoute: isLoggedIn ? '/main' : '/login',
      ),
    ),
  );
}

Future<MidtransSDK> _initMidtrans() async {
  final midtrans = await MidtransSDK.init(
    config: MidtransConfig(
      clientKey: dotenv.env['MIDTRANS_CLIENT_KEY'] ?? "",
      merchantBaseUrl: "",
      colorTheme: ColorTheme(
        colorPrimary: Colors.blue,
        colorPrimaryDark: Colors.blue,
        colorSecondary: Colors.blue,
      ),
    ),
  );
  midtrans.setUIKitCustomSetting(
    skipCustomerDetailsPages: true,
  );
  midtrans.setTransactionFinishedCallback((result) {
    Fluttertoast.showToast(
      msg: 'Transaction Completed',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  });
  return midtrans;
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
            '/register': (context) => const RegisterScreen(),
            '/login': (context) => const LoginScreen(),
            '/main': (context) => MainScreen(),
          },
        );
      },
    );
  }
}

final midtransProvider = Provider<MidtransSDK>((ref) {
  throw UnimplementedError();
});
