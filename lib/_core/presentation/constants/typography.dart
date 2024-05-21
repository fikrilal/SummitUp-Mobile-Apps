import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimensions.dart';

class TypographyStyles {
  static TextStyle get headlineLarge => TextStyle(
      fontSize: AppTextSize.xxxlarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey800,
      height: 1);

  static TextStyle get headlineMedium => TextStyle(
      fontSize: AppTextSize.xxlarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey800,
      height: 1);

  static TextStyle get headlineSmall => TextStyle(
      fontSize: AppTextSize.xlarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey800,
      height: 1);

  static TextStyle get titleLarge => TextStyle(
      fontSize: AppTextSize.large,
      fontWeight: FontWeight.w700,
      color: TextColors.grey700,
      height: 1.4);

  static TextStyle get titleMedium => TextStyle(
      fontSize: AppTextSize.mediumToLarge,
      fontWeight: FontWeight.w700,
      color: TextColors.grey700,
      height: 1.4);

  static TextStyle get titleSmall => TextStyle(
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w700,
      color: TextColors.grey700,
      height: 1.4);

  static TextStyle get labelLarge => TextStyle(
      fontSize: AppTextSize.mediumToLarge,
      fontWeight: FontWeight.w600,
      color: TextColors.grey700,
      height: 1.4);

  static TextStyle get labelMedium => TextStyle(
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w600,
      color: TextColors.grey700,
      height: 1.4);

  static TextStyle get labelSmall => TextStyle(
      fontSize: AppTextSize.small,
      fontWeight: FontWeight.w600,
      color: TextColors.grey700,
      height: 1.4);

  static TextStyle get bodyLarge => TextStyle(
      fontSize: AppTextSize.mediumToLarge,
      fontWeight: FontWeight.w400,
      color: TextColors.grey500,
      height: 1.4);

  static TextStyle get bodyMedium => TextStyle(
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w400,
      color: TextColors.grey500,
      height: 1.4);

  static TextStyle get bodySmall => TextStyle(
      fontSize: AppTextSize.small,
      fontWeight: FontWeight.w400,
      color: TextColors.grey500,
      height: 1.4);

  static TextStyle get buttonPrimary => TextStyle(
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      height: 1.4);

  static TextStyle get buttonSecondary => TextStyle(
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w800,
      color: BrandColors.brandPrimary600,
      height: 1.4);

  static TextStyle get buttonTertiary => TextStyle(
      fontSize: AppTextSize.medium,
      fontWeight: FontWeight.w500,
      color: TextColors.grey600,
      height: 1.4);
}