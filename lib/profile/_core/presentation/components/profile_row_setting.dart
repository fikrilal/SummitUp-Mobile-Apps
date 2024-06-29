import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../_core/presentation/components/texts/component_text.dart';
import '../../../../_core/presentation/constants/colors.dart';

class ProfileSettingRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  const ProfileSettingRow({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: TextColors.grey200,
              width: 1.h,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20.w,
              height: 20.h,
              color: TextColors.grey700,
            ),
            SizedBox(width: 10.w),
            TextComponent.bodyLarge(
              text,
              color: TextColors.grey700,
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/arrow_right_icon.svg',
              width: 20.w,
              height: 20.h,
              color: TextColors.grey700,
            ),
          ],
        ),
      ),
    );
  }
}
