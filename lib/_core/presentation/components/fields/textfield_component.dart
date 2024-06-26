import 'package:flutter/material.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/typography.dart';
import '../../constants/colors.dart';

/// CustomTextField is a StatelessWidget class that provides a custom TextField widget.
///
/// This widget allows you to create a TextField with various customization options, including hint text, icon, controller, keyboard type, text input action, function to be called on submission, focus node, obscure text, fill color, border color, text color, border width, text style, hint style, and border radius.
///
/// Parameters:
/// - [hintText] : The hint text to be displayed in the TextField. This parameter is required.
/// - [icon] : The icon to be displayed in the TextField. This can be an IconData or a Widget. This parameter is optional.
/// - [controller] : The controller for the TextField. This parameter is optional.
/// - [keyboardType] : The keyboard type for the TextField. This parameter is optional and defaults to TextInputType.text.
/// - [textInputAction] : The text input action for the TextField. This parameter is optional and defaults to TextInputAction.done.
/// - [onSubmitted] : The function to be called when the TextField is submitted. This parameter is optional.
/// - [focusNode] : The focus node for the TextField. This parameter is optional.
/// - [isObscure] : Whether the text in the TextField should be obscured. This parameter is optional and defaults to false.
/// - [fillColor] : The fill color for the TextField. This parameter is optional.
/// - [borderColor] : The border color for the TextField. This parameter is optional.
/// - [textColor] : The text color for the TextField. This parameter is optional.
/// - [borderWidth] : The border width for the TextField. This parameter is optional and defaults to 1.0.
/// - [textStyle] : The text style for the TextField. This parameter is optional.
/// - [hintStyle] : The hint style for the TextField. This parameter is optional.
/// - [borderRadius] : The border radius for the TextField. This parameter is optional and defaults to 100.0.
///
/// Usage example:
/// CustomTextField(
///   hintText: 'Enter your text here',
///   icon: Icon(Icons.search), // Use IconData
///   // or
///   icon: SvgPicture.asset('assets/icons/search_icon.svg'), // Use Widget
///   controller: myController, // optional
///   keyboardType: TextInputType.number, // optional
///   textInputAction: TextInputAction.next, // optional
///   onSubmitted: (text) { // optional
///     // Handle on submitted event
///   },
///   focusNode: myFocusNode, // optional
///   isObscure: true, // optional
///   fillColor: Colors.yellow, // optional
///   borderColor: Colors.red, // optional
///   textColor: Colors.blue, // optional
///   borderWidth: 2.0, // optional
///   textStyle: TextStyle(fontSize: 20), // optional
///   hintStyle: TextStyle(color: Colors.grey), // optional
/// )

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool isObscure;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final double borderRadius;
  final int maxLines;

  const TextFieldComponent({
    super.key,
    required this.hintText,
    this.icon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.borderWidth = 1.0,
    this.textStyle,
    this.hintStyle,
    this.borderRadius = 8.0,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      focusNode: focusNode,
      obscureText: isObscure,
      validator: validator ?? _defaultValidator,
      style: textStyle ?? TypographyStyles.fieldText,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? TypographyStyles.bodyMedium,
        prefixIcon: icon != null
            ? Padding(
                // Check if icon is not null
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: icon is IconData
                    ? Icon(icon as IconData, color: textColor)
                    : icon as Widget, // Check if icon is IconData or Widget
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? BrandColors.brandPrimary200,
            width: borderWidth!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? BrandColors.brandPrimary200,
            width: borderWidth!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? BrandColors.brandPrimary600,
            width: borderWidth!,
          ),
        ),
        filled: true,
        fillColor: fillColor ?? BrandColors.brandPrimary50.withOpacity(0.2),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
      ),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    // Additional validation can be added here
    return null;
  }
}
