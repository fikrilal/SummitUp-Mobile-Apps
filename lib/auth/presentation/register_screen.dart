import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/fields/textfield_component.dart';
import '../../_core/presentation/components/icons/icons_library.dart';
import '../../_core/presentation/components/texts/component_text.dart';
import '../../_core/presentation/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent.headlineLarge("Buat Akun SummitUp"),
                      SizedBox(height: 4.h),
                      TextComponent.bodyMedium(
                          "Buat akun kamu untuk mengakses seluruh fitur SummitUp",
                          maxLines: 3),
                      SizedBox(height: 24.h),
                      TextComponent.bodyMedium("Nama Lengkap", color: TextColors.grey700),
                      SizedBox(height: 8.h),
                      TextFieldComponent(
                        hintText: "Nama Lengkap",
                        icon: AppIcons.getIcon('user'),
                        controller: _nameController,
                      ),
                      SizedBox(height: 16.h),
                      TextComponent.bodyMedium("Email", color: TextColors.grey700),
                      SizedBox(height: 8.h),
                      TextFieldComponent(
                        hintText: "Email",
                        icon: AppIcons.getIcon('email'),
                        controller: _phoneController,
                      ),
                      SizedBox(height: 16.h),
                      TextComponent.bodyMedium("Username", color: TextColors.grey700),
                      SizedBox(height: 8.h),
                      TextFieldComponent(
                        hintText: "Username",
                        icon: AppIcons.getIcon('user'),
                        controller: _usernameController,
                      ),
                      SizedBox(height: 16.h),
                      TextComponent.bodyMedium("Password", color: TextColors.grey700),
                      SizedBox(height: 8.h),
                      TextFieldComponent(
                        hintText: "Password",
                        icon: AppIcons.getIcon('password'),
                        controller: _passwordController,
                      ),
                      SizedBox(height: 2.h),
                      SizedBox(height: 32.h),
                      ButtonComponent(
                        text: "Daftar",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComponent.bodyMedium("Sudah punya akun?"),
                  SizedBox(width: 4.w),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor:
                      WidgetStateProperty.all(Colors.transparent),
                      alignment: Alignment.centerLeft,
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    child: TextComponent.bodyMedium("Masuk"),
                  ),
                ],
              ),            ],
          ),
        ),
      ),
    );
  }
}