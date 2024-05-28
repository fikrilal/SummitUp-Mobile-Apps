import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';

import '../../../_core/presentation/components/appbar/appbar_component.dart';
import '../../../_core/presentation/components/fields/pinfields/pincodefield_component.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Verifikasi Nomor Telp.",
        onBack: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              TextComponent.bodyMedium(
                  "Masukkan kode verifikasi yang sudah dikirimkan ke nomor telepon kamu",
                  maxLines: 3),
              SizedBox(height: 24.h),
              PinCodeInput(
                onChanged: (value) {
                  print("Pin Changed: $value");
                },
              ),
              SizedBox(height: 2.h),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  alignment: Alignment.centerLeft,
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextComponent.bodyMedium("Belum menerima OTP?"),
                    SizedBox(width: 4.w),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        alignment: Alignment.centerLeft,
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: TextComponent.bodyMedium("Kirim Ulang"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              ButtonComponent(
                text: "Konfirmasi",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
