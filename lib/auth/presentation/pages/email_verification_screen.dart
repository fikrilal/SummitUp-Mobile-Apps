import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';

import '../../../_core/presentation/components/appbar/appbar_component.dart';
import '../../../_core/presentation/components/fields/pinfields/pincodefield_component.dart';
import '../providers/verify_providers.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  final String email;

  const EmailVerificationScreen({super.key, required this.email});

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends ConsumerState<EmailVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final verifyNotifier = ref.watch(verifyProvider.notifier);
    final isLoading = ref.watch(verifyProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Verifikasi Email",
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              TextComponent.bodyMedium(
                  "Masukkan kode verifikasi yang sudah dikirimkan ke email kamu",
                  maxLines: 3),
              SizedBox(height: 24.h),
              PinCodeInput(
                onChanged: (value) {
                  _otpController.text = value;
                },
              ),
              SizedBox(height: 2.h),
              TextButton(
                onPressed: () {
                  // Logic for resend OTP
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  alignment: Alignment.centerLeft,
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextComponent.bodyMedium("Belum menerima OTP?"),
                    SizedBox(width: 4.w),
                    TextButton(
                      onPressed: () {
                        // Logic for resend OTP
                      },
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
                onPressed: () {
                  verifyNotifier.verify(widget.email, _otpController.text, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

