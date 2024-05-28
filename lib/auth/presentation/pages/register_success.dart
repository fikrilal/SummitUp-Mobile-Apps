import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';

class RegisterSuccess extends StatefulWidget {
  const RegisterSuccess({super.key});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/success_illustration.svg',
                width: 300.w,
                height: 300.h,
              ),
              SizedBox(height: 16.h),
              TextComponent.headlineMedium(
                'Wohoo... Email kamu berhasil diverifikasi!',
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              TextComponent.bodyMedium(
                'Sekarang, kamu udah bisa akses semua layanan dari Summit.Up!',
                maxLines: 3,
                textAlign: TextAlign.center,
                color: TextColors.grey600,
              ),
              SizedBox(height: 40.h),
              ButtonComponent(text: 'Masuk ke Home', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
