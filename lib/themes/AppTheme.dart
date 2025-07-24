import 'package:evently_app/core/styles/FontStyles.dart';
import 'package:flutter/material.dart';
import '../core/colors/darkColors.dart';
import '../core/colors/lightColors.dart';
import '../core/colors/mainColors.dart';
import '../core/styles/mainStyles.dart';

abstract class AppTheme {
  static final MainColors lightColors = LightColors();
  static final MainColors darkColors = DarkColors();

  static final MainStyles fontStyles = FontStyles();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightColors.backgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: lightColors.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: lightColors.primary6),
      titleTextStyle: fontStyles.h4(lightColors.primary6),
    ),
    textTheme: TextTheme(
      headlineLarge: fontStyles.h2(lightColors.primary1),
      headlineMedium: fontStyles.h3(lightColors.primary1),
      headlineSmall: fontStyles.h4(lightColors.primary1),

      bodyLarge: fontStyles.bodyXLargeMedium(lightColors.primary2),
      bodyMedium: fontStyles.bodyLargeMedium(lightColors.primary2),
      bodySmall: fontStyles.bodyMediumMedium(lightColors.primary2),

      titleLarge: fontStyles.h6(lightColors.primary6),

      displayLarge: fontStyles.bodyLargeMedium(lightColors.primary6),
      displayMedium: fontStyles.bodyMediumRegular(lightColors.primary5),
      displaySmall: fontStyles.bodySmallRegular(lightColors.primary5),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColors.primary1,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),

        ),
      ),
    )
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkColors.backgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: darkColors.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: darkColors.primary6),
      titleTextStyle: fontStyles.h4(darkColors.primary6),
    ),
    textTheme: TextTheme(
      headlineLarge: fontStyles.h2(darkColors.primary1),
      headlineMedium: fontStyles.h3(darkColors.primary1),
      headlineSmall: fontStyles.h4(darkColors.primary1),

      bodyLarge: fontStyles.bodyXLargeMedium(darkColors.primary2),
      bodyMedium: fontStyles.bodyLargeMedium(darkColors.primary2),
      bodySmall: fontStyles.bodyMediumMedium(darkColors.primary2),

      titleLarge: fontStyles.h6(darkColors.primary6),

      displayLarge: fontStyles.bodyLargeMedium(darkColors.primary6),
      displayMedium: fontStyles.bodyMediumRegular(darkColors.primary5),
      displaySmall: fontStyles.bodySmallRegular(darkColors.primary5),

    ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColors.primary1,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),

          ),
        ),
      )


  );
}
