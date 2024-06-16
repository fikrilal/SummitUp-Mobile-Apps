import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';

import '../../constants/colors.dart';

/// CustomAppBar is a StatelessWidget that provides a base template for customizing AppBar widgets.
/// This AppBar can be configured with a title, an optional back button, and other custom styles.
///
/// Parameters:
/// - [title]: The text title displayed on the AppBar.
/// - [onBack]: Optional callback function triggered when the back button is pressed. If null, the back button is not displayed.
/// - [backgroundColor]: The background color of the AppBar. Defaults to transparent.
/// - [elevation]: The elevation or shadow cast by the AppBar. Defaults to 0 for a flat appearance.
/// - [showBottomBorder]: Determines whether to show a thin bottom border. Defaults to false.
///
/// Usage example:
/// ```dart
/// CustomAppBar(
///   title: 'Page Title',
///   onBack: () => Navigator.of(context).pop(),
///   backgroundColor: Colors.blue,
///   elevation: 2,
/// )
/// ```

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final Color? backgroundColor;
  final double? elevation;
  final bool showBottomBorder;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.showBottomBorder = false, // Controls visibility of the bottom border
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: onBack != null
          ? IconButton(
              icon: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                color: TextColors.grey500,
                height: 24.0,
                width: 24.0,
              ),
              onPressed: onBack,
            )
          : null,
      title: TextComponent.titleMedium(title, fontWeight: FontWeight.w500),
      bottom: showBottomBorder
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: TextColors.grey200,
                height: 1.0,
              ),
            )
          : null,
    );
  }
}

/// AppBarPrimary is a variant of CustomAppBar which does not display the bottom border.
/// It is used where a simple AppBar is needed without additional visual elements.
///
/// Inherits all parameters from CustomAppBar.
///
/// Usage example:
/// ```dart
/// AppBarPrimary(
///   title: 'Primary AppBar',
///   onBack: () => Navigator.of(context).pop(),
///   backgroundColor: Colors.green,
///   elevation: 1,
/// )
/// ```

class AppBarPrimary extends CustomAppBar {
  AppBarPrimary({
    required String title,
    VoidCallback? onBack,
    Color? backgroundColor,
    double? elevation,
  }) : super(
            title: title,
            onBack: onBack,
            backgroundColor: backgroundColor,
            elevation: elevation,
            showBottomBorder: false);
}

/// AppBarSecondary is a variant of CustomAppBar that includes a thin line below the AppBar,
/// typically used to visually separate the AppBar from the content below it. It uses the `AppText.body` style for the title,
/// making it distinct from AppBarPrimary which uses the default title styling.
///
/// Inherits all parameters from CustomAppBar but sets the `showBottomBorder` to true by default and applies `AppText.body` style to the title.
///
/// Usage example:
/// ```dart
/// AppBarSecondary(
///   title: 'Secondary AppBar',
///   onBack: () => Navigator.of(context).pop(),
///   backgroundColor: Colors.red,
///   elevation: 0,
/// )
/// ```

class AppBarSecondary extends CustomAppBar {
  AppBarSecondary({
    required String title,
    VoidCallback? onBack,
    Color? backgroundColor,
    double? elevation,
  }) : super(
            title: title,
            onBack: onBack,
            backgroundColor: backgroundColor,
            elevation: elevation,
            showBottomBorder: true // Show the bottom border
            );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: onBack != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: TextColors.grey500),
              onPressed: onBack,
            )
          : null,
      title: TextComponent.bodyMedium(title),
      // Use body text style for the title
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: TextColors.grey200,
          height: 1.0,
        ),
      ),
    );
  }
}
