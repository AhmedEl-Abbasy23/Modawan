import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/config/localize.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_values.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColorsDark.lightBlack,
  primaryColor: AppColorsDark.primary,
  fontFamily: translator.activeLanguageCode == ENGLISH
      ? FontConstants.nunitoFontFamily
      : FontConstants.lalezarFontFamily,
  appBarTheme: AppBarTheme(
    elevation: AppSize.s0,
    backgroundColor: AppColorsDark.lightBlack,
    titleSpacing: AppPadding.p16,
    titleTextStyle: TextStyle(
      color: AppColorsDark.primary,
      fontSize: FontSize.s35,
      fontFamily: translator.activeLanguageCode == ENGLISH
          ? FontConstants.nunitoFontFamily
          : FontConstants.lalezarFontFamily,
    ),
    actionsIconTheme: const IconThemeData(size: AppSize.s42),
  ),
  // scrolling color.
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColorsDark.darkGrey),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColorsDark.lightBlack,
    splashColor: AppColorsDark.darkGrey,
    elevation: AppSize.s14,
    iconSize: AppSize.s35,
  ),
);
