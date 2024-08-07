import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../_core/presentation/components/image/cached_image_component.dart';

class TripHistoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String group;
  final String price;
  final VoidCallback onTap;

  const TripHistoryCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.group,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: TextColors.grey200,
            width: 1.h,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 86.w,
                child: CachedImageComponent(
                  imageUrl: imageUrl,
                  aspectRatio: 1,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent.bodyLarge(
                      title,
                      maxLines: 2,
                      color: TextColors.grey700,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calendar_bold_icon.svg',
                          width: 16.w,
                          height: 16.h,
                          color: BrandColors.brandPrimary500,
                        ),
                        SizedBox(width: 8.w),
                        TextComponent.bodySmall(date),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/group_bold_icon.svg',
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.linkColor,
                        ),
                        SizedBox(width: 8.w),
                        TextComponent.bodySmall(group),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Divider(
              thickness: 1.h,
              color: TextColors.grey200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent.titleMedium(
                price,
                color: BrandColors.brandPrimary500,
              ),
              OutlinedButton(
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(
                      color: BrandColors.brandPrimary500, width: 1.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: TextComponent.bodyMedium(
                  "Llihat Detail",
                  color: BrandColors.brandPrimary500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
