import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/profile/presentation/components/profile_image_component.dart';
import 'package:summitup_mobile_apps/profile/presentation/pages/change_password_screen.dart';
import '../components/profile_row_setting.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      ProfileImageComponent(
                          imageUrl: 'https://picsum.photos/1000'),
                      SizedBox(height: 16.h),
                      TextComponent.titleLarge("Alexander Smith"),
                      // SizedBox(height: 2.h),
                      TextComponent.bodyMedium("kahfismith@gmail.com")
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                TextComponent.titleLarge("Tentang Akun"),
                ProfileSettingRow(
                  iconPath: 'assets/icons/profile_icon.svg',
                  text: "Profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                ),
                ProfileSettingRow(
                  iconPath: 'assets/icons/password_icon.svg',
                  text: "Kata Sandi",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    );
                  },
                ),
                ProfileSettingRow(
                  iconPath: 'assets/icons/favourite_icon.svg',
                  text: "Favorite",
                  onTap: () {
                    // Handle tap
                  },
                ),
                ProfileSettingRow(
                  iconPath: 'assets/icons/history_icon.svg',
                  text: "Riwayat Trip",
                  onTap: () {
                    // Handle tap
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
