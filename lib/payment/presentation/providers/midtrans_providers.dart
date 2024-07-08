import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final midtransProvider = Provider<MidtransSDK?>((ref) {
  return null;
});

final midtransInitProvider = FutureProvider<MidtransSDK?>((ref) async {
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
    _showToast('Transaction Completed', false);
  });
  return midtrans;
});

void _showToast(String msg, bool isError) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}