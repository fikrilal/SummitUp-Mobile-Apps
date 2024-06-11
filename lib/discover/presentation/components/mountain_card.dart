import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';

class MountainCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String location;
  final String elevation;
  final String rating;

  const MountainCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.elevation,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ]),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.w),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextComponent.titleLarge(title),
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
              TextComponent.bodySmall(location)
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/icon_flag.svg',
                width: 16.w,
                height: 16.h,
                color: TextColors.grey500,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodySmall(elevation),
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
        ],
      ),
    );
  }
}
// boxShadow: const [
// BoxShadow(
// color: Color(0x0F000000),
// blurRadius: 32,
// offset: Offset(0, 4),
// spreadRadius: -1,
// )
// ]