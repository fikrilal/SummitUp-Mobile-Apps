import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/profile/_core/presentation/components/profile_image_component.dart';
import 'package:summitup_mobile_apps/profile/change_password/presentation/pages/change_password_screen.dart';
import 'package:summitup_mobile_apps/profile/favorite/presentation/pages/favorite_screen.dart';
import 'package:summitup_mobile_apps/profile/history/presentation/pages/trip_history_screen.dart';
import '../../../../_core/providers/user_providers.dart';
import '../components/profile_row_setting.dart';
import '../../../edit_profile/presentation/pages/edit_profile_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userAsyncValue.when(
                  data: (user) {
                    return Center(
                      child: Column(
                        children: [
                          ProfileImageComponent(imageUrl: user.profileImageUrl),
                          SizedBox(height: 16.h),
                          TextComponent.titleLarge(user.fullname),
                          SizedBox(height: 4.h),
                          TextComponent.bodyMedium(user.email)
                        ],
                      ),
                    );
                  },
                  loading: () => Center(
                    child: Column(
                      children: [
                        ProfileImageComponent(imageUrl: 'https://picsum.photos/1000'),
                        SizedBox(height: 16.h),
                        Container(
                          width: 100.w,
                          height: 20.h,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          width: 200.w,
                          height: 20.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  error: (error, _) => Center(
                    child: Column(
                      children: [
                        ProfileImageComponent(imageUrl: 'https://picsum.photos/1000'),
                        SizedBox(height: 16.h),
                        TextComponent.titleLarge("Error"),
                        TextComponent.bodyMedium("Failed to load user data")
                      ],
                    ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteScreen(),
                      ),
                    );
                  },
                ),
                ProfileSettingRow(
                  iconPath: 'assets/icons/history_icon.svg',
                  text: "Riwayat Trip",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripHistoryScreen(),
                      ),
                    );
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
