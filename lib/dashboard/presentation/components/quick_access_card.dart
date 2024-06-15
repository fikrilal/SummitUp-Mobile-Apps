import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';

class QuickAccessCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const QuickAccessCard({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ZoomTapAnimation(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: BrandColors.brandPrimary100.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(iconPath),
                SizedBox(height: 4.h),
                TextComponent.bodySmall(
                  label,
                  fontSize: 13.sp,
                  color: TextColors.grey700,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  height: 1.2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
