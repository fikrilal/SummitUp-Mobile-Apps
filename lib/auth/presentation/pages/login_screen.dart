import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/fields/textfield_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';
import '../../../_core/presentation/components/icons/icons_library.dart';
import '../providers/login_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
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
    // Declare the loginProvider at the top of the build method
    final loginProviderNotifier = ref.watch(loginProvider.notifier);

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
                  maxLines: 3,
                ),
                SizedBox(height: 24.h),
                TextComponent.bodyMedium("Email", color: TextColors.grey700),
                SizedBox(height: 8.h),
                TextFieldComponent(
                  hintText: "Email",
                  icon: AppIcons.getIcon('user'),
                  validator: emailValidator,
                  controller: _emailController,
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
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      alignment: Alignment.centerLeft,
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: TextComponent.bodyMedium("Lupa password?"),
                  ),
                ),
                SizedBox(height: 32.h),
                ButtonComponent(
                  text: "Masuk",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Use loginProviderNotifier instead of loginProvider
                      loginProviderNotifier.login(
                        _emailController.text,
                        _passwordController.text,
                        context,
                      );
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
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        alignment: Alignment.centerLeft,
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
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
