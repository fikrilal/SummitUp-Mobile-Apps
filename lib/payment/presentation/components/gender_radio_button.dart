import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';

class GenderRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String label;
  final VoidCallback onChanged;

  const GenderRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: onChanged,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? BrandColors.brandPrimary500.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
            color:
                isSelected ? BrandColors.brandPrimary500 : TextColors.grey200,
            width: isSelected ? 1.5.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: isSelected
                  ? SvgPicture.asset(
                      'assets/icons/check_icon.svg',
                      width: 16.w,
                      height: 16.h,
                    )
                  : SvgPicture.asset(
                      'assets/icons/uncheck_icon.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
            ),
            SizedBox(width: 8.w),
            TextComponent.bodyMedium(
              label,
              fontWeight: FontWeight.w500,
              color:
                  isSelected ? BrandColors.brandPrimary500 : TextColors.grey700,
            ),
          ],
        ),
      ),
    );
  }
}
