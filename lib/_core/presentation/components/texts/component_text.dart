import 'package:flutter/material.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/typography.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final Color? color;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;

  TextComponent.headlineLarge(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines = 1,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.headlineLarge.copyWith(
          color: color ?? TypographyStyles.headlineLarge.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.headlineLarge.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.headlineLarge.fontWeight,
        );

  TextComponent.headlineMedium(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines = 1,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.headlineMedium.copyWith(
          color: color ?? TypographyStyles.headlineMedium.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.headlineMedium.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.headlineMedium.fontWeight,
        );

  TextComponent.headlineSmall(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines = 1,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.headlineSmall.copyWith(
          color: color ?? TypographyStyles.headlineSmall.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.headlineSmall.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.headlineSmall.fontWeight,
        );

  TextComponent.titleLarge(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.titleLarge.copyWith(
          color: color ?? TypographyStyles.titleLarge.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.titleLarge.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.titleLarge.fontWeight,
        );

  TextComponent.titleMedium(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.titleMedium.copyWith(
          color: color ?? TypographyStyles.titleMedium.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.titleMedium.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.titleMedium.fontWeight,
        );

  TextComponent.titleSmall(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.titleSmall.copyWith(
          color: color ?? TypographyStyles.titleSmall.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.titleSmall.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.titleSmall.fontWeight,
        );

  TextComponent.labelLarge(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.labelLarge.copyWith(
          color: color ?? TypographyStyles.labelLarge.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.labelLarge.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.labelLarge.fontWeight,
        );

  TextComponent.labelMedium(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.labelMedium.copyWith(
          color: color ?? TypographyStyles.labelMedium.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.labelMedium.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.labelMedium.fontWeight,
        );

  TextComponent.labelSmall(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.labelSmall.copyWith(
          color: color ?? TypographyStyles.labelSmall.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.labelSmall.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.labelSmall.fontWeight,
        );

  TextComponent.bodyLarge(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.bodyLarge.copyWith(
          color: color ?? TypographyStyles.bodyLarge.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.bodyLarge.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.bodyLarge.fontWeight,
        );

  TextComponent.bodyMedium(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.bodyMedium.copyWith(
          color: color ?? TypographyStyles.bodyMedium.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.bodyMedium.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.bodyMedium.fontWeight,
        );

  TextComponent.bodySmall(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
  }) : style = TypographyStyles.bodySmall.copyWith(
          color: color ?? TypographyStyles.bodySmall.color,
          height: height,
          fontSize: fontSize ?? TypographyStyles.bodySmall.fontSize,
          fontWeight: fontWeight ?? TypographyStyles.bodySmall.fontWeight,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}
