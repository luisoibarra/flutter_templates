import 'package:flutter/material.dart';

import 'colors.dart';
import 'sizes.dart';

abstract class AppThemes {
  static const buttonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.defaultBorderRadius),
        ),
      ),
    ),
  );

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.onBackground,
      onSecondaryContainer: AppColors.onSecondaryContainer,      
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: buttonStyle),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
  );
}
