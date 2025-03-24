import 'package:e_commerce/core/global/themes/dark/app_colors_dark.dart';
import 'package:flutter/material.dart';

ThemeData  getDarkTheme(BuildContext context) => ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColorsDark.kBackgroundColor,
  colorScheme: ColorScheme.light(
    primary: AppColorsDark.kPrimary,
    error: AppColorsDark.kErrorColor,
    onPrimary: AppColorsDark.kLightWhite,
    secondary: AppColorsDark.kGrey,
  ),
);
