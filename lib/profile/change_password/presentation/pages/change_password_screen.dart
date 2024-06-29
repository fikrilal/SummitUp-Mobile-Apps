import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/fields/textfield_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';

import '../../../../_core/presentation/components/icons/icons_library.dart';
import '../../../../_core/presentation/constants/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Ubah Password",
        showBottomBorder: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: TextColors.grey200,
                          width: 1.w,
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/password_icon.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextComponent.titleLarge("Ganti Kata Sandi"),
                    SizedBox(height: 2.h),
                    TextComponent.bodyMedium(
                      "Pastikan kata sandimu cukup rumit dan mudah diingat",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              TextComponent.bodyMedium(
                "Kata Sandi",
                color: TextColors.grey700,
              ),
              SizedBox(height: 8.h),
              TextFieldComponent(
                hintText: 'Kata Sandi Baru',
                icon: AppIcons.getIcon('password'),
              ),
              SizedBox(height: 16.h),
              TextComponent.bodyMedium(
                "Ulangi Kata Sandi",
                color: TextColors.grey700,
              ),
              SizedBox(height: 8.h),
              TextFieldComponent(
                hintText: 'Ulangi Kata Sandi Baru',
                icon: AppIcons.getIcon('password'),
                isObscure: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: ButtonComponent(
          text: "Simpan",
          onPressed: () {},
        ),
      ),
    );
  }
}
