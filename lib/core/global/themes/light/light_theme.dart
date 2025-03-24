import 'package:e_commerce/core/global/themes/light/app_colors_light.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme(BuildContext context) => ThemeData(
  scaffoldBackgroundColor: AppColorsLight.kBackgroundColor,
  colorScheme: ColorScheme.light(
    primary: AppColorsLight.kPrimary,
    error: AppColorsLight.kErrorColor,
    onPrimary: AppColorsLight.kLightBlack,
    secondary: AppColorsLight.kGrey,
    onSecondary: AppColorsLight.kwhite,
    onTertiary: AppColorsLight.kSuccessColor,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorsLight.kwhite,
    labelStyle: AppStyles.text14Medium.copyWith(color: AppColorsLight.kGrey),

    floatingLabelStyle: AppStyles.text14Medium.copyWith(
      color: AppColorsLight.kGrey,
    ),
    border: OutlineInputBorder(borderSide: BorderSide.none),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      textStyle: WidgetStateProperty.all(AppStyles.text14Medium),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.pressed)
            ? AppColorsLight.kPrimary
            : AppColorsLight.kBlack;
      }),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColorsLight.kPrimary),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      foregroundColor: WidgetStatePropertyAll(AppColorsLight.kwhite),
      textStyle: WidgetStateProperty.all((AppStyles.text14Medium)),
      overlayColor: WidgetStatePropertyAll(Colors.redAccent),
    ),
  ),
);
