import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/fields/textfield_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';

import '../../_core/presentation/components/icons/icons_library.dart';
import '../../_core/presentation/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // String pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\\.,;:\s@\"]+\.)+[^<>()[\]\\.,;:\s@\"]{2,})$';
    // RegExp regex = RegExp(pattern);
    // if (!regex.hasMatch(value)) {
    //   return 'Enter a valid email address';
    // }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent.headlineLarge('Masuk ke Akun Kamu'),
                SizedBox(height: 4.h),
                TextComponent.bodyMedium(
                    "Masukkan email dan password kamu untuk mengakses seluruh fitur SummitUp",
                    maxLines: 3),
                SizedBox(height: 24.h),
                TextComponent.bodyMedium("Username", color: TextColors.grey700),
                SizedBox(height: 8.h),
                TextFieldComponent(
                  hintText: "Username",
                  icon: AppIcons.getIcon('user'),
                  validator: emailValidator,
                  controller: _usernameController,
                ),
                SizedBox(height: 16.h),
                TextComponent.bodyMedium("Password", color: TextColors.grey700),
                SizedBox(height: 8.h),
                TextFieldComponent(
                  hintText: "Password",
                  icon: AppIcons.getIcon('password'),
                  validator: passwordValidator,
                  controller: _passwordController,
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor:
                      WidgetStateProperty.all(Colors.transparent),
                      alignment: Alignment.centerLeft,
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    child: TextComponent.bodyMedium("Lupa password?"),
                  ),
                ),
                SizedBox(height: 32.h),
                ButtonComponent(
                  text: "Masuk",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, proceed to login or whatever next step
                    }
                  },
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextComponent.bodyMedium("Belum punya akun?"),
                    SizedBox(width: 4.w),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor:
                        WidgetStateProperty.all(Colors.transparent),
                        alignment: Alignment.centerLeft,
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                      ),
                      child: TextComponent.bodyMedium("Daftar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}