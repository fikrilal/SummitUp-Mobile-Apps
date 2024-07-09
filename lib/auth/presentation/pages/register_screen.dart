import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/fields/textfield_component.dart';
import '../../../_core/presentation/components/icons/icons_library.dart';
import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';
import '../providers/register_providers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerNotifier = ref.watch(registerProvider.notifier);
    final isLoading = ref.watch(registerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                          controller: _emailController,
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
                        SizedBox(height: 16.h),
                        TextComponent.bodyMedium("Phone Number", color: TextColors.grey700),
                        SizedBox(height: 8.h),
                        TextFieldComponent(
                          hintText: "Phone Number",
                          icon: AppIcons.getIcon('phone'),
                          controller: _phoneController,
                        ),
                        SizedBox(height: 32.h),
                        ButtonComponent(
                          text: "Daftar",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              registerNotifier.register(
                                _usernameController.text,
                                _emailController.text,
                                _passwordController.text,
                                _nameController.text,
                                _phoneController.text,
                                context,
                              );
                            }
                          },
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        alignment: Alignment.centerLeft,
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: TextComponent.bodyMedium("Masuk"),
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
