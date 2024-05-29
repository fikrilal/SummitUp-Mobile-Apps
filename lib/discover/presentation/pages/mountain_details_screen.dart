import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';
import 'package:summitup_mobile_apps/discover/presentation/providers/mountain_detail_providers.dart'; // make sure this is the correct path

class MountainDetailsScreen extends ConsumerWidget {
  final int mountainId;

  const MountainDetailsScreen({super.key, required this.mountainId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mountainDetailAsyncValue =
        ref.watch(mountainDetailProvider(mountainId));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: mountainDetailAsyncValue.when(
            data: (mountainDetail) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: AspectRatio(
                        aspectRatio: 16 / 10,
                        child: CachedNetworkImage(
                          imageUrl: mountainDetail.imageUrl,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent.titleLarge(mountainDetail.name),
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
                        SvgPicture.asset('assets/icons/location_icon.svg',
                            width: 16.w,
                            height: 16.h,
                            color: TextColors.grey500),
                        SizedBox(width: 8.w),
                        TextComponent.bodyMedium(
                          mountainDetail.location,
                          fontSize: 13.sp,
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/icon_flag.svg',
                            width: 16.w,
                            height: 16.h,
                            color: TextColors.grey500),
                        SizedBox(width: 8.w),
                        TextComponent.bodyMedium(
                          mountainDetail.elevation.toString(),
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
                      mountainDetail.description,
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
                            SvgPicture.asset(
                                'assets/icons/arrow_right_icon.svg',
                                color: AppColors.linkColor)
                          ],
                        )
                      ],
                    ),
                    Card(
                      child: Column(
                        children: [
                          Skeletonizer(
                            enabled: false,
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
                                    SvgPicture.asset(
                                        'assets/icons/icon_danger.svg',
                                        height: 24.h,
                                        width: 24.w,
                                        color: TextColors.grey500),
                                    SizedBox(height: 4.h),
                                    TextComponent.bodySmall(
                                        "Gagal memuat gambar")
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
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, _) => Text('Failed to load details: $error'),
          ),
        ),
      ),
    );
  }
}
