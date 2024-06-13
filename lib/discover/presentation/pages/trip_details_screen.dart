import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';

import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/2000",
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: double.infinity,
                        color: TextColors.grey200,
                      ),
                      errorWidget: (context, url, error) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/icon_danger.svg',
                              height: 24.h,
                              width: 24.w,
                              color: TextColors.grey500),
                          SizedBox(height: 4.h),
                          TextComponent.bodySmall("Gagal memuat gambar")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                TextComponent.titleLarge("Trip Bromo Platinum Class"),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calendar_bold_icon.svg',
                      width: 16.w,
                      height: 16.h,
                      color: AppColors.successColor,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodySmall("3 hari"),
                    SizedBox(width: 12.w),
                    Container(
                      height: 12.h,
                      width: 1.w,
                      color: TextColors.grey200,
                    ),
                    SizedBox(width: 12.w),
                    SvgPicture.asset(
                      'assets/icons/group_bold_icon.svg',
                      width: 16.w,
                      height: 16.h,
                      color: AppColors.linkColor,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodySmall("10 orang"),
                    SizedBox(width: 12.w),
                    Container(
                      height: 12.h,
                      width: 1.w,
                      color: TextColors.grey200,
                    ),
                    SizedBox(width: 12.w),
                    SvgPicture.asset(
                      'assets/icons/icon_star.svg',
                      width: 16.w,
                      height: 16.h,
                      color: AppColors.warningColor,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodySmall("4.6"),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextComponent.titleMedium("Rp 450.000",
                        color: BrandColors.brandPrimary500),
                    TextComponent.bodySmall("/orang")
                  ],
                ),
                SizedBox(height: 16.h),
                Divider(
                  thickness: 1.h,
                  color: TextColors.grey200,
                ),
                SizedBox(height: 16.h),
                TextComponent.titleMedium("Fasilitas Tersedia"),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/shield_icon.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodyMedium("3x makan dan minum")
                  ],
                ),
                SizedBox(height: 8.w),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/shield_icon.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodyMedium("3x makan dan minum")
                  ],
                ),
                SizedBox(height: 16.h),
                Divider(
                  thickness: 1.h,
                  color: TextColors.grey200,
                ),
                SizedBox(height: 16.h),
                TextComponent.titleMedium("Tentang Trip"),
                SizedBox(height: 10.h),
                TextComponent.bodyMedium(
                  "Trip akan dilakukan selama 3 hari, peserta akan dibekali tentang pengetahuan dasar saat berada di basecamp gunung Bromo. Peserta diharapkan membawa kebutuhan pribadi masing-masing, seperti lorem ipsum",
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  height: 1.5,
                ),
                SizedBox(height: 40.h),
                ButtonComponent(text: "Booking Sekarang", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
