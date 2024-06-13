import 'package:flutter/material.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/typography.dart';
import '../../constants/colors.dart';

/// A custom elevated button that can be styled with an optional icon,
/// custom padding, border radius, and button type.
///
/// This button allows for primary, secondary, and tertiary button types,
/// each styled to fit the current theme's color scheme.
///
/// Parameters:
/// - [text]: The text to display on the button.
/// - [onPressed]: The callback that is called when the button is tapped.
/// - [icon]: Optional icon data to display.
/// - [buttonType]: The type of the button: [ButtonType.primary], [ButtonType.secondary], or [ButtonType.tertiary].
/// - [borderRadius]: The border radius of the button, defaulting to 100.0.
/// - [padding]: The padding inside the button, defaulting to symmetric padding of 16.0.
///
/// Usage example:
/// ```dart
/// CustomElevatedButton(
///   text: 'Submit',
///   onPressed: () {
///     // Handle on pressed event
///   },
///   icon: Icons.check, // optional
///   buttonType: ButtonType.primary, // optional
///   borderRadius: 100.0, // optional
///   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // optional
/// )
/// ```
class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Widget? customIcon;
  final ButtonType buttonType;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const ButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.customIcon,
    this.buttonType = ButtonType.primary,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.red; // Hover state color
          }
          return buttonType == ButtonType.primary
              ? Colors.white
              : BrandColors.brandPrimary600;
        },
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            if (buttonType == ButtonType.tertiary) {
              return TextColors.grey200;
            }
            return buttonType == ButtonType.primary
                ? BrandColors.brandPrimary700
                : BrandColors.brandPrimary100;
          }
          return buttonType == ButtonType.primary
              ? BrandColors.brandPrimary600
              : Colors.transparent;
        },
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          return Colors.transparent; // Overlay color for all states
        },
      ),
      side: WidgetStateProperty.resolveWith<BorderSide>(
        (Set<WidgetState> states) {
          if (buttonType == ButtonType.secondary) {
            return const BorderSide(color: BrandColors.brandPrimary600);
          } else if (buttonType == ButtonType.tertiary) {
            return const BorderSide(color: TextColors.grey300);
          }
          return BorderSide.none;
        },
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return 0;
          }
          return 0;
        },
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(padding),
      alignment: Alignment.center,
    );

    final primaryTextStyle = TypographyStyles.buttonPrimary;
    final secondaryTextStyle = TypographyStyles.buttonSecondary;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: mainAlignment(),
          children: [
            Text(
              text,
              style: buttonType == ButtonType.primary
                  ? primaryTextStyle
                  : buttonType == ButtonType.secondary
                      ? secondaryTextStyle
                      : TypographyStyles
                          .buttonTertiary, // Add a specific tertiary style
            ),
            if (icon != null || customIcon != null) ...[
              if (buttonType == ButtonType.tertiary) const Spacer(),
              if (customIcon != null)
                customIcon! // Use customIcon if available
              else
                Icon(icon, size: 20.0),
            ],
          ],
        ),
      ),
    );
  }

  MainAxisAlignment mainAlignment() {
    if (buttonType == ButtonType.tertiary) {
      return MainAxisAlignment.spaceBetween;
    }
    return MainAxisAlignment.center;
  }
}

enum ButtonType { primary, secondary, tertiary }
