import 'package:flutter/material.dart';

import 'app_colors_dark.dart';

ThemeData  getDarkTheme(BuildContext context) => ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColorsDark.kBackgroundColor,
  colorScheme: ColorScheme.light(
    primary: AppColorsDark.kPrimary,
    error: AppColorsDark.kErrorColor,
    onPrimary: AppColorsDark.kLightWhite,
    secondary: AppColorsDark.kGrey,
  ),
);
