import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';

class MountainDetailsScreen extends StatefulWidget {
  const MountainDetailsScreen({super.key});

  @override
  State<MountainDetailsScreen> createState() => _MountainDetailsScreenState();
}

class _MountainDetailsScreenState extends State<MountainDetailsScreen> {
  bool _enabled = true;

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
                Skeletonizer(
                  enabled: _enabled,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: AspectRatio(
                      aspectRatio: 16 / 10,
                      child: CachedNetworkImage(
                        imageUrl: 'https://picsum.photos/2000',
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
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponent.titleLarge("Gunung Bromo"),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 4.w),
                        decoration: BoxDecoration(
                            color: AppColors.warningColor.withOpacity(0.16),
                            borderRadius: BorderRadius.circular(100.w)),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/icon_star.svg',
                            ),
                            SizedBox(width: 4.w),
                            TextComponent.labelSmall(
                              "3.5 (120)",
                              fontSize: 13.sp,
                              color: AppColors.warningColor,
                            )
                          ],
                        ))
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location_icon.svg',
                      width: 16.w,
                      height: 16.h,
                      color: TextColors.grey500,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodyMedium(
                      "Malang, Jawa Timur",
                      fontSize: 13.sp,
                    )
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon_flag.svg',
                      width: 16.w,
                      height: 16.h,
                      color: TextColors.grey500,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodyMedium(
                      "3201 mdpl",
                      fontSize: 13.sp,
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Divider(
                  thickness: 1.h,
                  color: TextColors.grey200,
                ),
                SizedBox(height: 16.h),
                TextComponent.titleMedium("Tentang Gunung"),
                SizedBox(height: 8.h),
                TextComponent.bodySmall(
                  "Gunung Bromo adalah salah satu destinasi wisata terkenal di Indonesia, terletak di Provinsi Jawa Timur. Gunung ini merupakan bagian dari Taman Nasional Bromo Tengger Semeru dan terkenal dengan pemandangan matahari terbitnya yang spektakuler.",
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  height: 1.5,
                ),
                SizedBox(height: 16.h),
                Divider(
                  thickness: 1.h,
                  color: TextColors.grey200,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponent.titleMedium("Paket Trip Tersedia"),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextComponent.labelSmall("Semua",
                            color: AppColors.linkColor),
                        SizedBox(width: 2.w),
                        SvgPicture.asset('assets/icons/arrow_right_icon.svg',
                            color: AppColors.linkColor)
                      ],
                    )
                  ],
                ),
                Card(
                  child: Column(
                    children: [
                      Skeletonizer(
                        enabled: _enabled,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: 'https://picsum.photos/2000',
                            width: 220.w,
                            height: 180.w,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}