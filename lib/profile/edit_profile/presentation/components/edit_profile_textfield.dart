import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../_core/presentation/constants/colors.dart';
import '../../../../_core/presentation/constants/dimensions.dart';
import '../../../../_core/presentation/constants/typography.dart';

class EditProfileTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String initialValue;
  final TextEditingController controller;

  const EditProfileTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.initialValue,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TypographyStyles.bodySmall
        ),
        SizedBox(height: 4.h),
        TextField(
          controller: controller,
          style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: AppTextSize.medium,
              fontWeight: FontWeight.w500,
              color: TextColors.grey700,
              height: 1.4),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
            hintText: hintText,
            hintStyle: TypographyStyles.bodyMedium,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TextColors.grey200,
                width: 1.w,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TextColors.grey200,
                width: 1.w,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
