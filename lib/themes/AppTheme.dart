import 'package:flutter/material.dart';
import 'package:evently_app/core/colors/darkColors.dart';
import 'package:evently_app/core/colors/lightColors.dart';
import 'package:evently_app/core/colors/mainColors.dart';
import 'package:evently_app/core/styles/FontStyles.dart';
import 'package:evently_app/core/styles/mainStyles.dart';

class AppTheme {
  static ThemeData getTheme({
    required bool isDarkMode,
    required BuildContext context,
  }) {
    final MainColors colors = isDarkMode ? DarkColors() : LightColors();
    final MainStyles font = FontStyles();

    return ThemeData(
      scaffoldBackgroundColor: colors.backgroundColor,
      primaryColor: colors.primary1,
      highlightColor: colors.textColor,
      splashColor: colors.secondary,
      colorScheme: ColorScheme(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: colors.primary1,
        onPrimary: colors.textColor,
        secondary: colors.textFieldTextColor,
        onSecondary: colors.textColor2,
        tertiary: colors.textColor3,
        error: colors.error,
        onError: colors.textColor,
        onPrimaryContainer:colors.selectedCategoryColor,
        onSecondaryContainer: colors.textFieldTextColor ,
        surface: colors.primary2,
        onSurface: colors.textColor,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colors.secondary,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.primary6),
        titleTextStyle: font.h4(context, colors.primary6),
      ),
      textTheme: TextTheme(
        headlineLarge: font.h2(context, colors.textColor),
        headlineMedium: font.h3(context, colors.textColor),
        headlineSmall: font.h4(context, colors.textColor),

        bodyLarge: font.bodyXLargeMedium(context, colors.textColor),
        bodyMedium: font.bodyLargeMedium(context, colors.textColor),
        bodySmall: font.bodyMediumMedium(context, colors.textColor),

        titleLarge: font.h6(context, colors.textColor),

        displayLarge: font.bodyLargeMedium(context, colors.textColor),
        displayMedium: font.bodyMediumRegular(context, colors.textColor),
        displaySmall: font.bodySmallRegular(context, colors.textColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary1,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.secondary,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colors.secondary,

      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
        hintStyle: font.bodySmallRegular(context, colors.textFieldTextColor),
        labelStyle: font.bodyMediumRegular(context, colors.textFieldTextColor),
        prefixIconColor: colors.textFieldTextColor,
        suffixIconColor: colors.textFieldTextColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: colors.primary1, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: colors.primary1, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: colors.primary1, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: colors.primary1, width: 1.0),
        ),

      ),

    );
  }
}
