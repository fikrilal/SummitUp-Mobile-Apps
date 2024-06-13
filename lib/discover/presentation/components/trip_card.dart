import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';

class TripCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String duration;
  final String rating;
  final String price;
  final bool isLoading;

  const TripCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.rating,
    required this.price,
    this.isLoading = false,
  });

  factory TripCard.loading() {
    return const TripCard(
      title: '',
      imageUrl: '',
      duration: '',
      rating: '',
      price: '',
      isLoading: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
            color: TextColors.grey100,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 40,
              offset: Offset(0, 4),
              spreadRadius: -30,
            )
          ],
        ),
        padding: EdgeInsets.all(12.w),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 220.w,
                height: 180.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(height: 10.h),
              Container(width: 180.w, height: 20.h, color: Colors.white),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 100.w, height: 16.h, color: Colors.white),
                  SizedBox(width: 12.w),
                  Container(width: 50.w, height: 16.h, color: Colors.white),
                ],
              ),
              SizedBox(height: 10.h),
              Container(width: 60.w, height: 20.h, color: Colors.white),
            ],
          ),
        ),
      );
    } return Container(
      width: 250.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: TextColors.grey100,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 40,
            offset: Offset(0, 4),
            spreadRadius: -30,
          )
        ],
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
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
                  TextComponent.bodySmall("Gagal memuat gambar")
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextComponent.titleMedium(title),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/calendar_icon.svg',
                width: 16.w,
                height: 16.h,
                color: TextColors.grey500,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodySmall(duration),
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
                color: TextColors.grey500,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodySmall(rating),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextComponent.titleMedium(price, color: BrandColors.brandPrimary500),
              TextComponent.bodySmall("/orang")
            ],
          ),
        ],
      ),
    );
  }
}