import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';

class EquipmentRentalCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rating;
  final String price;
  final bool isLoading;
  final int equipmentId;

  const EquipmentRentalCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    this.isLoading = false,
    required this.equipmentId,
  });

  factory EquipmentRentalCard.loading() {
    return const EquipmentRentalCard(
      title: '',
      imageUrl: '',
      rating: '',
      price: '',
      isLoading: true,
      equipmentId: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        width: 180.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
            color: TextColors.grey100,
            width: 1,
          ),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 180.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.w),
                    topRight: Radius.circular(10.w),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0, bottom: 12.h, right: 12.w, left: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Container(
                      width: double.infinity,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: double.infinity,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 90.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        color: BrandColors.brandPrimary50,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: BrandColors.brandPrimary100,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w),
              topRight: Radius.circular(10.w),
            ),
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
                  SvgPicture.asset('assets/icons/icon_danger.svg',
                      height: 24.h, width: 24.w, color: TextColors.grey500),
                  SizedBox(height: 4.h),
                  TextComponent.bodySmall("Gagal memuat gambar")
                ],
              ),
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: 0, bottom: 12.h, right: 12.w, left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                TextComponent.titleSmall(title, fontWeight: FontWeight.w600),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon_star.svg',
                      width: 16.w,
                      height: 16.h,
                      color: AppColors.warningColor,
                    ),
                    SizedBox(width: 6.w),
                    TextComponent.bodySmall(rating),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextComponent.titleSmall(price,
                        color: BrandColors.brandPrimary500,
                        fontWeight: FontWeight.w600),
                    TextComponent.bodySmall("/pcs")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}