import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';

class TripOverviewCard extends StatelessWidget {
  final String tanggal;
  final String lokasiTitikKumpul;

  const TripOverviewCard({
    Key? key,
    required this.tanggal,
    required this.lokasiTitikKumpul,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: TextColors.grey300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/calendar_bold_icon.svg',
                width: 16.w,
                height: 16.h,
                color: TextColors.grey500,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodyMedium("Jadwal Trip"),
            ],
          ),
          SizedBox(height: 8.h),
          TextComponent.titleMedium(tanggal),
          SizedBox(height: 12.h),
          Divider(
            thickness: 1.h,
            color: TextColors.grey200,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location_icon.svg',
                width: 16.w,
                height: 16.h,
                color: TextColors.grey500,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodyMedium("Titik Kumpul"),
            ],
          ),
          SizedBox(height: 8.h),
          TextComponent.titleMedium(lokasiTitikKumpul),
        ],
      ),
    );
  }
}
