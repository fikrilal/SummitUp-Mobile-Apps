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
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../providers/global_providers.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MidtransSDK? _midtrans;
  final List<Widget> pages = [
    HomepageScreen(),
    MountainListScreen(),
    DiscountScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _initSDK();
  }

  void _initSDK() async {
    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: dotenv.env['MIDTRANS_CLIENT_KEY'] ?? "",
        merchantBaseUrl: "",
        colorTheme: ColorTheme(
          colorPrimary: Colors.blue,
          colorPrimaryDark: Colors.blue,
          colorSecondary: Colors.blue,
        ),
      ),
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    _midtrans?.setTransactionFinishedCallback((result) {
      _showToast('Transaction Completed', false);
    });
  }

  void _showToast(String msg, bool isError) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    _midtrans?.removeTransactionFinishedCallback();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
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
      },
    );
  }
}
