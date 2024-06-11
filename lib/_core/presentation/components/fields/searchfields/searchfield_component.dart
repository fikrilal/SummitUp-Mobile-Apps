import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/typography.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final BorderSide? outlineBorderSide;

  const SearchField({
    Key? key,
    this.hintText = 'Search',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.search,
    this.onSubmitted,
    this.focusNode,
    this.hintTextStyle,
    this.inputTextStyle,
    this.outlineBorderSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      style: inputTextStyle ?? TypographyStyles.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle ?? TypographyStyles.bodyMedium,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: SvgPicture.asset(
            'assets/icons/search_icon.svg',
            width: 20.0,
            height: 20.0,
            color: TextColors.grey500,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: outlineBorderSide ??
              const BorderSide(color: TextColors.grey200, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),

          /// Use BorderSide.none if you don't want to use any border
          borderSide: outlineBorderSide ??
              const BorderSide(color: TextColors.grey300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: outlineBorderSide ??
              const BorderSide(color: BrandColors.brandPrimary600, width: 1),
        ),

        /// Set to 'false' if you do not want to use a color on the field
        filled: false,
        fillColor: TextColors.grey100,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
      ),
    );
  }
}