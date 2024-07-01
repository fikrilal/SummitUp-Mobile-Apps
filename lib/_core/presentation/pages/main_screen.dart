import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/typography.dart';
import 'package:summitup_mobile_apps/dashboard/presentation/pages/homepage_screen.dart';
import 'package:summitup_mobile_apps/discount/presentation/pages/discount_screen.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/mountain_list_screen.dart';
import 'package:summitup_mobile_apps/profile/_core/presentation/pages/profile_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../providers/global_providers.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<Widget> pages = [
    HomepageScreen(),
    MountainListScreen(),
    DiscountScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: TextColors.grey200, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) =>
              ref.read(currentIndexProvider.notifier).state = index,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_home_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_home_active_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_discover_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_discover_active_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_discount_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_discount_active_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              label: 'Discounts',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_profile_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: SvgPicture.asset(
                  'assets/icons/nav_icons/nav_profile_active_icon.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              label: 'Profile',
            ),
          ],
          showUnselectedLabels: true,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: TextColors.grey700,
          unselectedItemColor: TextColors.grey400,
          selectedLabelStyle: TypographyStyles.navActive,
          unselectedLabelStyle: TypographyStyles.navInactive,
        ),
      ),
    );
  }
}
