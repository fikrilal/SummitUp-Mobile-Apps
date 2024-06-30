import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'dimensions.dart';

class TypographyStyles {
  static const String fontFamily = 'DMSans';

  static TextStyle get headlineLarge => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.xxxlarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey800,
      height: 1);

  static TextStyle get headlineMedium => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.xxlarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey800,
      height: 1);

  static TextStyle get headlineSmall => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.xlarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey800,
      height: 1);

  static TextStyle get titleLarge => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.large,
      fontWeight: FontWeight.w700,
      color: TextColors.grey700,
      height: 1);

  static TextStyle get titleMedium => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.mediumToLarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey700,
      height: 1);

  static TextStyle get titleSmall => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w700,
      color: TextColors.grey700,
      height: 1);

  static TextStyle get labelLarge => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.mediumToLarge,
      fontWeight: FontWeight.w600,
      color: TextColors.grey700,
      height: 1);

  static TextStyle get labelMedium => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w600,
      color: TextColors.grey700,
      height: 1);

  static TextStyle get labelSmall => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.small,
      fontWeight: FontWeight.w600,
      color: TextColors.grey700,
      height: 1);

  static TextStyle get bodyLarge => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.mediumToLarge,
      fontWeight: FontWeight.w400,
      color: TextColors.grey500,
      height: 1);

  static TextStyle get bodyMedium => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w400,
      color: TextColors.grey500,
      height: 1);

  static TextStyle get bodySmall => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.xsmall,
      fontWeight: FontWeight.w400,
      color: TextColors.grey500,
      height: 1);

  static TextStyle get buttonPrimary => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      height: 1);

  static TextStyle get buttonSecondary => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w800,
      color: BrandColors.brandPrimary600,
      height: 1);

  static TextStyle get buttonTertiary => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w500,
      color: TextColors.grey600,
      height: 1);

  static TextStyle get fieldText => TextStyle(
      fontFamily: fontFamily,
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w400,
      color: TextColors.grey700,
      height: 1);

  static TextStyle get navActive => TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: TextColors.grey700,
      height: 2);

  static TextStyle get navInactive => TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: TextColors.grey400,
      height: 2);
}