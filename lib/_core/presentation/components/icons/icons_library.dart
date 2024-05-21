import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';

/// AppIcons provides centralized access to all icons used within the application.
/// It includes methods to dynamically fetch icons based on a string identifier, and
/// to retrieve custom SVG icons from the assets directory.
///
/// Methods:
///   - [getIcon]: Dynamically retrieves an icon using a string key.
///   - [customIcon]: Retrieves a custom SVG icon from the assets directory.
///
/// Usage example:
/// ```dart
/// Icon homeIcon = AppIcons.getIcon('home', color: Colors.blue, size: 30);
/// Widget customSVG = AppIcons.customIcon('custom_icon_name', color: Colors.red, size: 40);
/// ```

class AppIcons {
  // Static map of icon names to IconData from the flutter_hicons package.
  static final Map<String, IconData> _iconMap = {
    'email': Hicons.message_35_light_outline,
    'phone': Hicons.call_light_outline,
    'user': Hicons.profile_1_light_outline,
    'password': Hicons.lock_1_light_outline,
    'home': Hicons.home_1_light_outline,
    'settings': Hicons.setting_light_outline,
    'add_report': Hicons.document_add_1_light_outline,
    // Add more icons as needed
  };

  /// Retrieves an icon based on a string key.
  ///
  /// Parameters:
  ///   - [iconName]: A string key representing the icon in the _iconMap.
  ///   - [color]: Optional. Specifies the color of the icon.
  ///   - [size]: Optional. Specifies the size of the icon.
  ///
  /// Returns:
  ///   An Icon widget configured with the specified IconData, color, and size.
  ///   Returns an error icon if the iconName does not match any key in _iconMap.
  static Icon getIcon(String iconName, {Color? color, double? size}) {
    IconData iconData = _iconMap[iconName] ?? Icons.error; // Fallback to error icon
    return Icon(iconData, color: color ?? TextColors.grey500, size: size ?? 24.0);
  }

  /// Retrieves a custom SVG icon from the assets directory.
  ///
  /// Parameters:
  ///   - [assetName]: The name of the SVG file stored in the assets/icons/ directory, without the '.svg' extension.
  ///   - [color]: Optional. The color to apply to the SVG icon.
  ///   - [size]: Optional. The width and height of the SVG icon (assumed square for simplicity).
  ///
  /// Returns:
  ///   An SvgPicture widget displaying the SVG icon, with the specified color and size.
  static Widget customIcon(String assetName, {Color? color, double? size}) {
    return SvgPicture.asset(
      'assets/icons/$assetName.svg',
      color: color ?? TextColors.grey500,
      width: size ?? 24.0,
      height: size ?? 24.0,
      semanticsLabel: '$assetName Icon',
    );
  }
}