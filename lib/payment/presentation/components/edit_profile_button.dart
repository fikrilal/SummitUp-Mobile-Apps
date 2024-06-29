import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';

class EditProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String iconPath;

  const EditProfileButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: BrandColors.brandPrimary500, width: 1.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 16.w,
            height: 16.h,
            color: BrandColors.brandPrimary500,
          ),
          SizedBox(width: 8.w),
          TextComponent.bodyMedium(
            text,
            color: BrandColors.brandPrimary500,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}