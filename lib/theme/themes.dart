// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'darkColors.dart';
import 'lightColors.dart';
import 'styles.dart';

class Themes {
  //light theme
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(secondary: LightColors.ACCENT_COLOR),
    primaryColor: LightColors.PRIMARY_COLOR,
    brightness: Brightness.light,
    hintColor: LightColors.TEXT_HINT_COLOR,
    cardColor: LightColors.SCAFFOLD_BACKGROUND_COLOR,
    dividerColor: LightColors.DIVIDER_COLOR,
    backgroundColor: LightColors.SCAFFOLD_BACKGROUND_COLOR,
    scaffoldBackgroundColor: LightColors.SCAFFOLD_BACKGROUND_COLOR,
    //appBar theme
    appBarTheme: Styles.getAppBarTheme(isLightTheme: true),

    //elevated button theme
    elevatedButtonTheme: Styles.getElevatedButtonTheme(isLightTheme: true),

    //text theme
    textTheme: Styles.getTextTheme(isLightTheme: true),

    //chip theme
    // chipTheme: Styles.getChipTheme(isLightTheme: true),

    //icon theme
    iconTheme: Styles.getIconTheme(isLightTheme: true),

    // dialog Theme
    dialogTheme: Styles.getDialogTheme(isLightTheme: true),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: LightColors.PRIMARY_COLOR, //thereby
    ),
  );

  // dark theme
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(secondary: LightColors.ACCENT_COLOR),
    primaryColor: DarkColors.PRIMARY_COLOR,
    brightness: Brightness.dark,
    hintColor: DarkColors.TEXT_HINT_COLOR,
    cardColor: DarkColors.SCAFFOLD_BACKGROUND_COLOR,
    dividerColor: DarkColors.DIVIDER_COLOR,
    backgroundColor: DarkColors.SCAFFOLD_BACKGROUND_COLOR,
    scaffoldBackgroundColor: DarkColors.SCAFFOLD_BACKGROUND_COLOR,

    //appBar theme
    appBarTheme: Styles.getAppBarTheme(isLightTheme: false),

    //elevated button
    elevatedButtonTheme: Styles.getElevatedButtonTheme(isLightTheme: false),

    //text theme
    textTheme: Styles.getTextTheme(isLightTheme: false),

    // //chip theme
    // chipTheme: Styles.getChipTheme(isLightTheme: false),

    //icon theme
    iconTheme: Styles.getIconTheme(isLightTheme: false),

      // dialog Theme
    dialogTheme:  Styles.getDialogTheme(isLightTheme: false),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: LightColors.PRIMARY_COLOR, //thereby
    ),
  );
}
