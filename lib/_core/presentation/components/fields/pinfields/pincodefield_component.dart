import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/typography.dart';
import '../../../constants/colors.dart';

/// A custom widget that wraps a `PinCodeTextField` for entering pin codes.
///
/// This component is highly configurable with sensible defaults for ease of use.
/// It dynamically calculates the height of each pin field based on text size and vertical padding.
///
/// Parameters:
/// - [length]: Number of pin fields. Default is 4.
/// - [onChanged]: Function called on text change. This parameter is required.
/// - [verticalPadding]: Vertical padding inside each pin field. Default is 20.0.
/// - [fontSize]: Font size of text within the pin fields. Uses body style font size by default.
/// - [fieldWidthFactor]: Factor to divide screen width for field width calculation. Default is 5.
/// - [activeColor]: Color when the pin field is active. Default is BrandColors.brandPrimary.
/// - [inactiveColor]: Color when the pin field is inactive. Default is TextColors.grey300.
/// - [borderWidth]: Width of the border around pin fields. Default is 1.0.
/// - [borderRadius]: Border radius of the pin fields. Default is a circular radius of 100.
///
/// Usage Example:
/// This widget can be easily integrated into any part of your application where pin code input is needed.
/// Here is how to instantiate and use the `PinCodeInput` within a form or any other widget:
///
/// Scaffold(
///   body: Center(
///     child: PinCodeInput(
///       onChanged: (value) {
///         print("Pin Changed: $value");
///       },
///       // Optional parameters with defaults shown
///       length: 4,
///       verticalPadding: 20.0,
///       fontSize: 16.0,
///       fieldWidthFactor: 5,
///       activeColor: BrandColors.brandPrimary,
///       inactiveColor: TextColors.grey300,
///       borderWidth: 1.0,
///       borderRadius: BorderRadius.circular(100),
///     ),
///   ),
/// );

class PinCodeInput extends StatelessWidget {
  final int length;
  final ValueChanged<String> onChanged;
  final double verticalPadding;
  final double? fontSize;
  final double fieldWidthFactor; // Factor of screen width
  final Color activeColor;
  final Color inactiveColor;
  final double borderWidth;
  final BorderRadius borderRadius;

  const PinCodeInput({
    Key? key,
    this.length = 4,
    required this.onChanged,
    this.verticalPadding = 20.0,
    this.fontSize,
    this.fieldWidthFactor = 5, // Default to splitting width into fifths
    this.activeColor = BrandColors.brandPrimary600,
    this.inactiveColor = TextColors.grey300,
    this.borderWidth = 1.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine text size from the textStyle or use a default
    double effectiveFontSize = fontSize ??
        TypographyStyles.titleSmall.fontSize ??
        14; // Default to 14 if fontSize is not set

    // Calculate field height dynamically
    double fieldHeight = effectiveFontSize + (verticalPadding * 2);

    return PinCodeTextField(
      appContext: context,
      length: length,
      onChanged: onChanged,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: borderRadius,
        fieldHeight: fieldHeight,
        fieldWidth: MediaQuery.of(context).size.width / fieldWidthFactor,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        borderWidth: borderWidth,
      ),
      keyboardType: TextInputType.number,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      textStyle:
      TypographyStyles.bodyMedium.copyWith(fontSize: effectiveFontSize),
    );
  }
}