import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/payment_success_illustration.svg',
                width: 300.w,
                height: 300.h,
              ),
              SizedBox(height: 16.h),
              TextComponent.headlineMedium("Pembayaran Berhasil!"),
              SizedBox(height: 8.h),
              TextComponent.bodyMedium(
                "Pembayaran kamu berhasil diverifikasi. Sekarang kamu dapat melakukan konseling sesuai jadwal yang kamu ambil",
                maxLines: 5,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              ButtonComponent(
                text: "Selanjutnya",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
